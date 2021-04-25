import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Components/components.dart';
import 'package:todo_app/Shared/cubit/cubit.dart';
import 'package:todo_app/Shared/cubit/states.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppCubit.get(context).doneTasks.length >0? BlocConsumer<AppCubit,AppState>(
      listener: (context,state){},
      builder:(context,state) => ListView.separated(
        itemBuilder: (context,index){
          return buildTaskItem(
              model: AppCubit.get(context).doneTasks,
              index: index,
              context:context
          );
        },
        separatorBuilder: (context,index){
          return Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: AppCubit.get(context).doneTasks.length,
      ),
    ) : Center(child: Container(padding:EdgeInsets.all(20.0),child: Text("You Don't Have Any Tasks , Yet")));
  }
}
