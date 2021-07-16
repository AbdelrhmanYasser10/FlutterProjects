import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netflix_ui_app/models/models.dart';
import 'package:netflix_ui_app/styles/colors.dart';

import 'home_screen.dart';

class MoviesScreen extends StatefulWidget {

  final String imgLink;
  final String name;
  final String rating;
  final String releaseYear;
  final String description;
  final String age;
  final String type;

  MoviesScreen({
  @required this.imgLink,
  @required this.name,
  @required this.rating,
  @required this.releaseYear,
  @required this.description,
  @required this.type,
  @required this.age,
  });


  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,

            child: Image(
              image: NetworkImage(widget.imgLink),
              fit: BoxFit.cover,
            ),
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 7),
            opacity: HomeScreen.opacityLevel,
            child: Container(
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                      colors: [
                        Colors.black12,
                        Colors.black54,
                        Colors.black,
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '#${widget.name.toUpperCase()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Oswald',
                        fontSize: 36.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.releaseYear} | ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Oswald',
                          fontSize: 12.0,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                          ),
                          child: Text(
                            '${widget.age}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Oswald',
                            fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ' | ${widget.type.toUpperCase()} ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Oswald',
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${widget.rating}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontFamily: 'Oswald',
                        ),
                      ),
                      Text(
                        '/10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Oswald',
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      MaterialButton(
                        onPressed: (){

                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'My List',
                              style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Colors.white,
                                fontSize: 16.0
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: (){

                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3.0,
                                ),
                                child: Icon(
                                  Icons.play_circle_fill_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right:15.0,
                                    left: 5.0,
                                    top: 8.0,
                                    bottom: 8.0,
                                ),
                                child: Text(
                                  'PLAY',
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      color: Colors.black,
                                      fontSize: 16.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: (){

                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'More Info',
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Colors.white,
                                  fontSize: 16.0
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),

                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'Oswald',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
