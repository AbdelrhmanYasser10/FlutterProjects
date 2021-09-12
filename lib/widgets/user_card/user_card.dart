import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget userCard({
  required UserModel user,
  bool? isTop,
}){
  return InkWell(
    onTap: () {},
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(backgroundImage:NetworkImage(user.imageUrl!)),
        SizedBox(width: 6.0),
        Flexible(
          child: Text(
            isTop == true?user.name!.substring(0,user.name!.indexOf(' ')):user.name!,
            style:TextStyle(
                fontSize: isTop==true?12.0:16.0,
              color: Colors.black,
              fontWeight: isTop==true?FontWeight.bold:FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}