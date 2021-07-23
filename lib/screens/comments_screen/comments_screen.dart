import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/colors.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

// ignore: must_be_immutable
class CommentScreen extends StatelessWidget {
  static String postId="";
  String hint = "Write Your Comment ...";
  var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder:(context,state) {
        var allComments = SocialCubit.get(context).comment;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: "Comments",
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder:(context,index)=> defaultComment(context,allComments[index]),
                      separatorBuilder:(context,index)=>SizedBox(
                        height: 10.0,
                      ),
                      itemCount: allComments.length),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: commentController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: hint,
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(onPressed: (){
                        SocialCubit.get(context).addComments(postId,commentController.text);
                        commentController.text = '';
                      }, icon: Icon(
                        IconBroken.Send,
                        color: defaultColor,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

Widget defaultComment(context,comment){
  var user = SocialCubit.get(context).getCurrentUser(comment.uId);
  print(CommentScreen.postId);
  print(comment.postId);
  return comment.postId == CommentScreen.postId?Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Theme.of(context).scaffoldBackgroundColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage(user.image),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${user.name}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0
              ),
            )
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 25.0
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${comment.comment}',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ):Container(
    child: SizedBox(
      height: 0.0,
    ),
  );
}
