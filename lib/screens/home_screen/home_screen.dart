import 'dart:math';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:note_application/controllers/quote_controller/quote_controller.dart';
import 'package:note_application/controllers/task_controller/task_controller.dart';
import 'package:note_application/screens/add_task_screen/add_task_screen.dart';
import 'package:note_application/shared/services/notify_helper/notify_helper.dart';
import 'package:note_application/shared/services/theme_services/theme_services.dart';
import 'package:note_application/shared/style/colors/colors.dart';
import 'package:note_application/shared/style/themes/themes.dart';
import '../../shared/widgets/filled_card.dart';
import '../../shared/widgets/my_button.dart';
import '../../shared/widgets/tasks_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //uninitialized value
  late NotifyHelper notifyHelper;
  DateTime _selectedDate = DateTime.now();
  final TaskController _taskController = Get.put(TaskController());
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    _taskController.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Column(
        children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMd().format(DateTime.now()),
                        style: subHeadingStyle,
                      ),
                       Text(
                        "Today",
                        style: headingStyle,
                      ),
                    ],
                  ),
                  MyButton(
                    label: '+ Add Task',
                    function: () async{
                      await Get.to(()=>const AddTaskScreen());
                      _taskController.getTasks();
                    },
                  ),

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
              ),
              child: DatePicker(
                DateTime.now(),
                height: 100.0,
                initialSelectedDate: DateTime.now(),
                selectionColor: primaryColor,
                selectedTextColor: whiteColor,

                dateTextStyle:GoogleFonts.lato(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                dayTextStyle:GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 16
                ),
                monthTextStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 14
                ),
                onDateChange: (date){
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Obx((){
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _taskController.taskList.length,
                    itemBuilder: (_,index){
                      var curTask = _taskController.taskList[index];
                      if(curTask.repeat == 'Daily'){
                        notifyHelper.scheduledNotification(
                            hour: int.parse(curTask.startTime.split(":")[0]),
                            minute: int.parse(curTask.startTime.split(":")[1].split((" "))[0]),
                            task: curTask,
                        );
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      var task =  curTask;
                                      Get.bottomSheet(
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 4.0,
                                          ),
                                          height:task.isCompleted == 1 ? MediaQuery.of(context).size.height * 0.24 : MediaQuery.of(context).size.height * 0.32,
                                          color: Get.isDarkMode? darkGreyColor : whiteColor,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 6.0,
                                                width: 120.0,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    color: Get.isDarkMode ? Colors.grey.shade600 : Colors.grey.shade300
                                                ),
                                              ),
                                              const Spacer(),
                                              task.isCompleted == 1 ?
                                              Container() : _bottomSheetButton(
                                                context: context,
                                                label: "Task Completed",
                                                function: () async{
                                                  var val = await _taskController.updateTask(id: task.id!);
                                                  if(val == 1){
                                                    Get.snackbar(
                                                      "Updated",
                                                      "The task is now Completed",
                                                      snackPosition: SnackPosition.BOTTOM,
                                                      backgroundColor: Colors.green,
                                                      colorText: Colors.white,
                                                      icon: const Icon(Icons.remove_circle_outline_rounded , color:  Colors.white,),
                                                    );
                                                  }
                                                  Get.back();
                                                },
                                                color: primaryColor,
                                              ),
                                              _bottomSheetButton(
                                                context: context,
                                                label: "Delete Task",
                                                function: ()async{
                                                  var val = await _taskController.deleteTask(id: task.id!);
                                                  if(val == 1){
                                                    Get.snackbar(
                                                      "Deleted",
                                                      "The task is deleted successfully",
                                                      snackPosition: SnackPosition.BOTTOM,
                                                      backgroundColor: Colors.red,
                                                      colorText: Colors.white,
                                                      icon: const Icon(Icons.remove_circle_outline_rounded , color:  Colors.white,),
                                                    );
                                                  }
                                                  Get.back();
                                                },
                                                color: Colors.red.shade300,
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              _bottomSheetButton(
                                                  context: context,
                                                  label: "Close",
                                                  function: (){
                                                    Get.back();
                                                  },
                                                  color: Colors.white,
                                                  isClose: true
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: TaskTile(
                                      _taskController.taskList[index],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      if(curTask.date == DateFormat.yMd().format(_selectedDate)){
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      var task =  curTask;
                                      Get.bottomSheet(
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 4.0,
                                          ),
                                          height:task.isCompleted == 1 ? MediaQuery.of(context).size.height * 0.24 : MediaQuery.of(context).size.height * 0.32,
                                          color: Get.isDarkMode? darkGreyColor : whiteColor,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 6.0,
                                                width: 120.0,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    color: Get.isDarkMode ? Colors.grey.shade600 : Colors.grey.shade300
                                                ),
                                              ),
                                              const Spacer(),
                                              task.isCompleted == 1 ?
                                              Container() : _bottomSheetButton(
                                                context: context,
                                                label: "Task Completed",
                                                function: () async{
                                                  var val = await _taskController.updateTask(id: task.id!);
                                                  if(val == 1){
                                                    Get.snackbar(
                                                      "Updated",
                                                      "The task is now Completed",
                                                      snackPosition: SnackPosition.BOTTOM,
                                                      backgroundColor: Colors.green,
                                                      colorText: Colors.white,
                                                      icon: const Icon(Icons.remove_circle_outline_rounded , color:  Colors.white,),
                                                    );
                                                  }
                                                  Get.back();
                                                },
                                                color: primaryColor,
                                              ),
                                              _bottomSheetButton(
                                                context: context,
                                                label: "Delete Task",
                                                function: ()async{
                                                  var val = await _taskController.deleteTask(id: task.id!);
                                                  if(val == 1){
                                                    Get.snackbar(
                                                      "Deleted",
                                                      "The task is deleted successfully",
                                                      snackPosition: SnackPosition.BOTTOM,
                                                      backgroundColor: Colors.red,
                                                      colorText: Colors.white,
                                                      icon: const Icon(Icons.remove_circle_outline_rounded , color:  Colors.white,),
                                                    );
                                                  }
                                                  Get.back();
                                                },
                                                color: Colors.red.shade300,
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              _bottomSheetButton(
                                                  context: context,
                                                  label: "Close",
                                                  function: (){
                                                    Get.back();
                                                  },
                                                  color: Colors.white,
                                                  isClose: true
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: TaskTile(
                                      _taskController.taskList[index],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }else{
                        return const SizedBox();
                      }
                });
              }),
            ),
        ],
      ),
    );
  }

  AppBar _appBar()=>AppBar(
    backgroundColor: context.theme.backgroundColor,
    elevation: 0.0,
    leading: GestureDetector(
      onTap: (){
        //toggle theme
        ThemeService().switchTheme();
        notifyHelper.displayNotification(
          title:"Theme Changed",
          body: Get.isDarkMode? "Activated Light Theme":"Activated Dark Theme",
        );
      },
      child: Icon(
        Get.isDarkMode? Icons.sunny : Icons.nightlight_round,
        size: 20.0,
        color: Get.isDarkMode?Colors.white : Colors.black,
      ),
    ),
    actions: [
       TextButton(
            onPressed: (){
              Random random = Random();
              int randomNumber = random.nextInt(QuoteController.quotes.length);
              showDialog(
                  context: context,
                  builder: (context)=>Scaffold(
                    backgroundColor: context.theme.backgroundColor,
                    body: FilledCard(
                      quote: QuoteController.quotes[randomNumber],
                    ),
                  ),
              );

            },
            child: const Text(
              'Quote for you ❤'
            ),
        ),
       const SizedBox(
        width: 20.0,
      ),
    ],
  );
  Widget _bottomSheetButton({
  required String label,
  required VoidCallback function,
  required Color color,
  required BuildContext context,
  bool isClose = false,
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 4.0),
      child: GestureDetector(
        onTap: function,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          height: 55.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 2,
              color: isClose ? Get.isDarkMode?Colors.grey.shade600 : Colors.grey.shade300:color,
            ),
            color: isClose ? Colors.transparent : color,
          ),
          child: Center(
            child: Text(
              label,
              style: isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
