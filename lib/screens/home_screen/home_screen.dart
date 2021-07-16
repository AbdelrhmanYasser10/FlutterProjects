
import 'package:covid_19_app/models/model.dart';
import 'package:covid_19_app/shared/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            "Covid-19",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 3.0,
                                ),
                                child: CircleAvatar(
                                  child: Image(
                                      image: NetworkImage("https://vectorflags.s3.amazonaws.com/flags/eg-circle-01.png"),
                                  ),
                                  radius: 25.0,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  vertical: 2.0,
                                ),
                                child: Text(
                                  "EG",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Are you feeling sick?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                            'If you feel sick with any of covid-19 symptoms\nplease call or SMS us immediately for help',
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: MaterialButton(
                                      onPressed: (){},
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                              Icons.phone,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          //Spacer(),
                                          Text(
                                            "Call Now",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                      ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: MaterialButton(
                                      onPressed: (){},
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                              Icons.sms,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          //Spacer(),
                                          Text(
                                            "Send SMS",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Expanded(
                child:SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Prevention',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 210.0,
                          child: ListView.separated(
                              separatorBuilder: (context,index)=>SizedBox(width: 15.0,),
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context,index)=>preventionContent(index)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              //height: 200.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  color: mainColor
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width/6,
                                      ),
                                      child: Text(
                                        'Do your own test!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width/4,
                                      ),
                                      child: Text(
                                        'Follow the instructions to\ndo your own test',
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: mainColor,
                                    radius: 50.0,
                                    child: Image(
                                      image:NetworkImage("https://image.flaticon.com/icons/png/512/3580/3580415.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
