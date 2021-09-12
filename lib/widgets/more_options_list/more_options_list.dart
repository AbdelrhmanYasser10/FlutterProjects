import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:facbook_app/widgets/user_card/user_card.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [Mdi.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [Mdi.accountMultiple, Colors.cyan, 'Friends'],
    [Mdi.facebookMessenger, Colors.blueAccent, 'Messenger'],
    [Mdi.flag, Colors.orange, 'Pages'],
    [Mdi.storefront, Colors.blueAccent, 'Marketplace'],
    [Icons.ondemand_video, Colors.blueAccent, 'Watch'],
    [Mdi.calendarStar, Colors.red, 'Events'],
  ];

  final UserModel currentUser;

  const MoreOptionsList({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: userCard(user: currentUser),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Option(
              icon: option[0],
              color: option[1],
              label: option[2],
            ),
          );
        },
      ),
    );
  }
}

class Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const Option({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}