import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:facbook_app/shared/data/data.dart';
import 'package:facbook_app/widgets/online_user/online_user.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 578;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + users.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: roomButton(),
              );
            }
            final UserModel user = users[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: OnlineUserWidget(
                imageUrl: user.imageUrl!,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget roomButton() => Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 0.0,
        color: Colors.white,
        textColor: Colors.blue,
        child: Row(
          children: [
            Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.purple,
            ),
            const SizedBox(width: 4.0),
            Text(
                'Create Room',
              style: TextStyle(
                fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
    );
