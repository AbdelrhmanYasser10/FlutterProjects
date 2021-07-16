import 'package:covid_19_app/shared/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      horizontal: 25.0,
                    ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: Image(
                                image: NetworkImage("https://play-lh.googleusercontent.com/sdvgBLwun1bPr00CtsuXIESoNtl-zh6cwqtXotzgRVowcbqiwkSb78rEvwDGt3TupQ"),
                            ),
                            radius: 50.0,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),

                ),
                SizedBox(
                    height: 15.0
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  readOnly: true,
                  enabled: false,
                  initialValue: "User name",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ) ,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Colors.blueGrey,
                    ),
                    labelText: "",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: mainColor,
                          width: 5.0,
                          style: BorderStyle.solid
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  readOnly: true,
                  enabled: false,
                  initialValue: "user@mail.com",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ) ,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.blueGrey,
                    ),
                    labelText: "",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: mainColor,
                          width: 5.0,
                          style: BorderStyle.solid
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  readOnly: true,
                  enabled: false,
                  initialValue: "01xxxxxxxxxxx",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ) ,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.blueGrey,
                    ),
                    labelText: "",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: mainColor,
                          width: 5.0,
                          style: BorderStyle.solid
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: primaryColor,
                        ),
                        child: MaterialButton(
                          onPressed: (){},
                          child : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              horizontal: 5.0
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                Text(
                                    "Edit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: dangerColor,
                        ),
                        child: MaterialButton(
                          onPressed: (){},
                          child : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 5.0
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_circle_outlined,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                Text(
                                  "Delete",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Spacer(),
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
        )
    );
  }
}
