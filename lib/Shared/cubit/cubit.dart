import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/Modules/archived_screen/ArchivedScreen.dart';
import 'package:todo_app/Modules/done_tasks/DoneScreen.dart';
import 'package:todo_app/Modules/new_tasks/TasksScreen.dart';
import 'package:todo_app/Shared/cubit/states.dart';

class AppCubit extends Cubit <AppState>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  bool isBottomSheetShown = false;


  bool isThemeLight = true;

  IconData fabIcon = Icons.edit;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];


  List<String> titles =[
    "New Tasks",
    "Completed Tasks",
    "Archived Tasks",
  ];
  List<Widget> screens = [
    TasksScreen(),
    DoneScreen(),
    ArchivedScreen(),
  ];
  Database db;

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }



  void createDB() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataBase(database);
        print('database opened');
      },
    ).then((value) {
      db = value;
      emit(AppCreateDataBaseState());
    });
  }


  insertToDB({
    @required String title,
    @required String time,
    @required String date,
  }) async {
    await db.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDataBaseState());

        getDataBase(db);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
      return null;
    });
  }

  void getDataBase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
      {
        if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
        else archivedTasks.add(element);
      });

      emit(AppGetDataBaseState());
    });
  }
  void changeBottomSheetState({
  @required bool isShown,
    @required IconData icon,
}){
    isBottomSheetShown = isShown;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  void resetValues(){
    titleController.text = "";
    timeController.text = "";
    dateController.text="";
    emit(AppResetValuesState());
  }


  void updateData({
    @required String status,
    @required int id,
  }) async
  {
    db.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value)
    {
      getDataBase(db);
      emit(AppUpdateValueState());
    });
  }

  void deleteData({
    @required int id,
  }) async
  {
    db.rawUpdate(
      'DELETE FROM tasks  WHERE id = ?',
      [id],
    ).then((value)
    {
      getDataBase(db);
      emit(AppDeleteValueState());
    });
  }
}