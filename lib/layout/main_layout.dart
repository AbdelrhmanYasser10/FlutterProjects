import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui_app/models/models.dart';
import 'file:///D:/MSP/MSPFlutter/TrainProject/netflix_ui_app/lib/styles/colors.dart';


// ignore: must_be_immutable
class MainLayout extends StatefulWidget {

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            physics: BouncingScrollPhysics(),// Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children:[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(350.0)),
                        border: Border.all(
                          color: defaultColor,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(350.0)),
                        child: CircleAvatar(
                          radius: 50.0,
                          child: Image(
                            image: NetworkImage('https://scontent.fcai20-2.fna.fbcdn.net/v/t1.6435-9/125952512_714458682827214_1732112543415407914_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeEKvA14JMs7Q_XqUjy-Svhi4BEZ5GcccqzgERnkZxxyrEJmb_jVapuqljJlStW6CJAD5ql4QiwuWS9nCbmCpSUi&_nc_ohc=meyDcA20CFcAX-_otbL&_nc_ht=scontent.fcai20-2.fna&oh=2c4c02acf8f3657308a267d8e71c9b0a&oe=60CBC230'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Abdelrhman Yasser',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Oswald'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        'Profile'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Abel',
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        'MyList'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Abel',

                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        'Downloads'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Abel',

                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        'Favourites'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Abel',

                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        'Log Out'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Abel',

                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ScreensModel.index,
       onTap: (i){
         setState(() {
           ScreensModel.index = i;
           print(ScreensModel.index);
         });
       },
        backgroundColor: Colors.black,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Abdel',
          color: defaultColor
        ),
        selectedItemColor: defaultColor,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Abdel',
          color: Colors.white,
        ),
        items: [
          BottomNavigationBarItem(
              icon:Icon(
                Icons.movie,
              ),
              label: 'Movies'.toUpperCase(),
          ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.slow_motion_video_rounded,
              ),
              label: 'Series'.toUpperCase()
          ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.ondemand_video,
              ),
              label: 'Coming Soon'.toUpperCase()
          ),
        ],
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'N E T F L I X',
          style: TextStyle(
            color: defaultColor,
            fontFamily: 'BebasNeue',
            fontSize: 36.0,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ScreensModel.screens[ScreensModel.index],
    );
  }
}
