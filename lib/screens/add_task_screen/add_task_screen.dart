import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_application/controllers/task_controller/task_controller.dart';
import 'package:note_application/screens/add_task_screen/constants/constants.dart';
import 'package:note_application/shared/style/colors/colors.dart';
import 'package:note_application/shared/style/themes/themes.dart';
import 'package:note_application/shared/widgets/my_button.dart';

import '../../models/task_model/task_model.dart';
import '../../shared/constants/constatns.dart';
import '../../shared/widgets/input_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now());
  String _endTime = DateFormat("hh:mm a").format(DateTime.now());
  int _selectedRemind = 5;
  String _selectedRepeat = 'None';
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(
        context: context
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20.0 , right: 20.0
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: headingStyle,
              ),
              InputField(
                title: "Title",
                hint: "Enter Your Title",
                controller: _titleController,
              ),
              InputField(
                title: "Note",
                hint: "Enter Your Note",
                controller: _noteController,
              ),
              InputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: (){
                    _getDateFromUser();
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: InputField(
                        title: "Start Time",
                        hint: _startTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUser(isStartTime: true);
                          },
                          icon: const Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: InputField(
                        title: "End Time",
                        hint: _endTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUser(isStartTime: false);
                          },
                          icon: const Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ),
                ],
              ),
              InputField(
                  title: "Remind",
                  hint: '$_selectedRemind minutes early',
                  widget: DropdownButton(
                    onChanged: (String? value){
                      if(value != null) {
                        setState(() {
                          _selectedRemind = int.parse(value);
                        });
                      }
                    },
                    underline: const SizedBox(height: 0,),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32.0,
                    elevation: 4,
                    style: subTitleStyle,
                    items: remindList.map<DropdownMenuItem<String>>((e) =>DropdownMenuItem<String>(value: e.toString() ,child: Text(e.toString()))).toList(),
                  ),
              ),
              InputField(
                  title: "Repeat",
                  hint: _selectedRepeat,
                  widget: DropdownButton(
                    onChanged: (String? value){
                      if(value != null) {
                        setState(() {
                          _selectedRepeat = value;
                        });
                      }
                    },
                    underline: const SizedBox(height: 0,),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32.0,
                    elevation: 4,
                    style: subTitleStyle,
                    items: repeatList.map<DropdownMenuItem<String>>((e) =>DropdownMenuItem<String>(value: e ,child: Text(e))).toList(),
                  ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: titleStyle,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Wrap(
                        children: List<Widget>.generate(
                            4,
                            (index)=>GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedColor = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0
                                ),
                                child: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: colors[index],
                                  child: _selectedColor == index ? const Icon(
                                    Icons.done,
                                    color: whiteColor,
                                    size: 16.0,
                                  ) : const SizedBox(),
                                ),
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                  MyButton(
                      function:_validateData,
                      label: 'Create Task',
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar({required BuildContext context})=>AppBar(
    backgroundColor: context.theme.backgroundColor,
    elevation: 0.0,
    leading: GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 20.0,
        color: Get.isDarkMode?Colors.white : Colors.black,
      ),
    ),
  );
  void _getDateFromUser() async{
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2023),
    );
    if(pickerDate != null){
      setState(() {
        _selectedDate = pickerDate;
      });
    }
  }
  void _getTimeFromUser({
    required bool isStartTime,
   }) async {
    int hour = int.parse(_startTime.split(":")[0]);
    int minute = int.parse(_startTime.split(":")[1].split((" "))[0]);
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: hour,
        minute: minute,
      ),
      initialEntryMode: TimePickerEntryMode.dial
    );
    if (pickedTime != null) {
      String formatTime = pickedTime.format(context);
      if(isStartTime){
        setState((){
        _startTime = formatTime;
        });
      }
      else{
        setState((){
          _endTime = formatTime;
        });
      }
    }
  }

  void _addTaskToDB() async {
    var task = Task(
      note: _noteController.text,
      title: _titleController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      remind: _selectedRemind,
      color: _selectedColor,
      repeat: _selectedRepeat,
      isCompleted: 0,
    );
    int val = await _taskController.addTask(task: task);
    if(val != 0){
      Get.snackbar(
        "Saved",
        "The task is saved successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.green,
        icon: const Icon(Icons.done , color:  Colors.green,),
      );
    }
  }
  void _validateData(){
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty){
      /*Add to database*/
      _addTaskToDB();

      /*Back to main screen*/
      Get.back();
    }
    else if (_titleController.text.isEmpty || _noteController.text.isEmpty){
      Get.snackbar(
      "Required",
      "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.red,
        icon: const Icon(Icons.warning_amber_rounded , color: Colors.red,),
      );
    }
  }
}
