import 'package:flutter/material.dart';
import 'package:todo_app/Shared/cubit/cubit.dart';

Widget buildTaskItem({
  @required int index,
  @required BuildContext context,
  @required List<Map>model,
})=>Dismissible(
  background: Container(
    color: Colors.red,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
                Icons.remove_circle_rounded,
                color: Colors.white,
                size: 50.0,
              ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 50.0,
          )
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.remove_circle_rounded,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ),
      ],
    ),
  ),
  key: Key("id"),
  child:Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        CircleAvatar(

          radius:40.0,

          child: Text(

            '${model[index]['time']}',

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                '${model[index]['title']}',

                style: TextStyle(

                    fontSize: 18.0,

                    fontWeight: FontWeight.bold

                ),

              ),

              Text(

                '${model[index]['date']}',

                style: TextStyle(

                  color: Colors.grey,

                ),

              ),



            ],

          ),

        ),

        IconButton(

          icon: Icon(Icons.check_circle,color: Colors.green,),

          onPressed: (){

            AppCubit.get(context).updateData(

              status: 'done',

              id: model[index]['id'],

            );

          },

        ),

        IconButton(

          icon: Icon(Icons.archive,color: Colors.grey,),

          onPressed: (){

            AppCubit.get(context).updateData(

                status: 'archived',

                id: model[index]['id'],

            );

          },

        ),



      ],

    ),

  ),
  onDismissed: (direction){
      AppCubit.get(context).deleteData(
          id: model[index]['id'],
      );
  },

);