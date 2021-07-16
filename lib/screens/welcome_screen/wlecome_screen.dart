import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image:NetworkImage("https://m.foolcdn.com/media/millionacres/original_images/image2_mdDMemJ.jpg?crop=4:3,smart"),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(

              color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                      Colors.black12,
                      HexColor("#4169E1"),

                    ],
                    stops: [
                      0.0,
                      1.0,
                    ]
                ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'VILLA',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 24.0,
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.category , color: Colors.white,))
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            child: Column(
              children: [
                Spacer(),
                Text(
                  'Find Your,\n',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Dream House',
                  style: TextStyle(
                    fontFamily: 'CinzelDecorative',
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_on),
                        labelText: 'Search for house',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        labelStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                        )
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color:HexColor("#1434A4"),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                      child: MaterialButton(
                          onPressed: (){},
                        child: Text(
                          'FIND NOW',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
