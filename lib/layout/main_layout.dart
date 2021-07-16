import 'package:covid_19_app/models/model.dart';
import 'package:covid_19_app/shared/colors.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  int index = 0;
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index,
        backgroundColor: Colors.white,
        onTap: (int index){
          setState(() {
            widget.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon:Icon(
              Icons.home_filled,
              color: widget.index == 0 ? mainColor : Colors.blueGrey,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon:Icon(
              Icons.stacked_bar_chart,
              color: widget.index == 1 ? mainColor : Colors.blueGrey,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon:Icon(
              Icons.person,
              color: widget.index == 2 ? mainColor : Colors.blueGrey,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: mainColor,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.notifications_none,color: Colors.white,),
          ),
        ],
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu,color: Colors.white,),
        ),
      ),
      body:screens[widget.index],
    );
  }
}
