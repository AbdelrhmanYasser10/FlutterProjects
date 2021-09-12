import 'package:facbook_app/shared/data/data.dart';
import 'package:facbook_app/widgets/user_card/user_card.dart';
import 'package:flutter/material.dart';

Widget contactsList()=> Container(
  constraints: BoxConstraints(maxWidth: 280.0),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
              'Contacts',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.video_call,
            color: Colors.grey[600],
          ),
          SizedBox(width: 8.0),
          Icon(
            Icons.search,
            color: Colors.grey[600],
          ),
           SizedBox(width: 8.0),
          Icon(
            Icons.more_horiz,
            color: Colors.grey[600],
          ),
        ],
      ),
      Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: userCard(user: users[index]),
            );
          },
        ),
      ),
    ],
  ),
);