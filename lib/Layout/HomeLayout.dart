import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Shared/cubit/cubit.dart';
import 'package:todo_app/Shared/cubit/states.dart';


class HomeLayout extends StatelessWidget {
  var keyScaffold = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();



  //FormControllers




  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => AppCubit()..createDB(),
      child: BlocConsumer<AppCubit,AppState>(

        listener:(context,state){
          if(state is AppInsertDataBaseState){
                Navigator.pop(context);
          }
        },
        builder: (context,state) => Scaffold(
          key: keyScaffold,

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              AppCubit.get(context).titles[AppCubit.get(context).currentIndex].toUpperCase(),
              style: TextStyle(
                  color: AppCubit.get(context).currentIndex == 0?Colors.blueAccent:AppCubit.get(context).currentIndex==1?Colors.green:AppCubit.get(context).currentIndex==2?Colors.grey:Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0
              ),
            ),
          ),
          floatingActionButton: AppCubit.get(context).currentIndex == 0 ? FloatingActionButton(
            onPressed: (){
              if(AppCubit.get(context).isBottomSheetShown){
                if(formKey.currentState.validate()) {
                  AppCubit.get(context).insertToDB(title: AppCubit.get(context).titleController.text, date: AppCubit.get(context).dateController.text, time: AppCubit.get(context).timeController.text);
                  AppCubit.get(context).resetValues();
                  // insertToDB(
                  //   title: titleController.text ,
                  //   time: timeController.text ,
                  //   date: dateController.text,
                  // ).then((value) {
                  //
                  //   getDataBase(db).then((value){
                  //     Navigator.pop(context);
                  //
                  //     /*  setState(() {
                  //       tasks = value;
                  //       isBottomSheetShown = false;
                  //       fabIcon = Icons.edit;
                  //       titleController.text = "";
                  //       timeController.text = "";
                  //       dateController.text = "";
                  //     });*/
                  //   });
                  //
                  // });

                }
                else{

                }
              }
              else {
                keyScaffold.currentState.showBottomSheet((context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: AppCubit.get(context).titleController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.0,
                                  ),
                                ),
                                prefixIcon: Icon(
                                    Icons.title
                                ),
                                labelText: "Title",
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return'Title must not be empty';
                                }
                                return null;
                              },

                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              onTap: (){
                                showDatePicker(
                                  initialDate:  DateTime.now() ,
                                  context: context,
                                  firstDate:  DateTime.now() ,
                                  lastDate:DateTime(DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
                                ).then((value) {
                                  AppCubit.get(context).dateController.text = DateFormat.yMMMd().format(value);
                                }).catchError((error){});
                              },
                              controller: AppCubit.get(context).dateController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.0,
                                  ),
                                ),
                                prefixIcon: Icon(
                                    Icons.date_range
                                ),
                                labelText: "Task Date",
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return'Date must not be empty';
                                }
                                return null;
                              },

                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              onTap: (){
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  AppCubit.get(context).timeController.text = value.format(context).toString();
                                }).catchError((error){});
                              },
                              controller: AppCubit.get(context).timeController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.0,
                                  ),
                                ),
                                prefixIcon: Icon(
                                    Icons.watch_later
                                ),
                                labelText: "Task Time",
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return'Time must not be empty';
                                }
                                return null;
                              },

                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).closed.then((value){
                 AppCubit.get(context).changeBottomSheetState(
                     isShown: false,
                     icon: Icons.edit
                  );
                 AppCubit.get(context).resetValues();
                });
                AppCubit.get(context).changeBottomSheetState(
                    isShown: true,
                    icon: Icons.add
                );
              }
            },
            child: Icon(
              AppCubit.get(context).fabIcon,
            ),
          ): null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: AppCubit.get(context).currentIndex,
            onTap: (index){
              AppCubit.get(context).changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_sharp,
                  ),
                  label: "Tasks"
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check,
                  ),
                  label: "Done"
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: "Archived"
              ),
            ],
          ),

          body:
          SafeArea(
            child: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
          ),
        ),
      ),
    );
  }


}

