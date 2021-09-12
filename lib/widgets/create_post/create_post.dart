import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreatePostWidget extends StatelessWidget {
  UserModel currentUser;

  CreatePostWidget({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 578;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.imageUrl!),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                )
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () => print('Live'),
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text('Live',style: TextStyle(color: Colors.black),),
                  ),
                   VerticalDivider(width: 8.0),
                  TextButton.icon(
                    onPressed: () => print('Photo'),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text('Photo',style: TextStyle(color: Colors.black),),
                  ),
                   VerticalDivider(width: 8.0),
                  TextButton.icon(
                    onPressed: () => print('Room'),
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: Text('Room',style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}