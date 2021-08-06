import 'package:breaking_bad/data_layer/models/characters_model/character_model.dart';
import 'package:breaking_bad/presentation_layer/shared/colors/colors.dart';
import 'package:breaking_bad/presentation_layer/shared/components/components.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CharacterDetailsScreen extends StatelessWidget {
  Character? character;
  CharacterDetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            buildSliverAppBar(
              character:character!,
            ),
            SliverList(
                delegate:SliverChildListDelegate(
                  [
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          charInfo(
                              title: "Job : ",
                              value: character!.occupation!.join(" / ")
                          ),
                          divider(
                            endIndent: 295,
                          ),

                          charInfo(
                              title: "Appeared in : ",
                              value: character!.category!
                          ),
                          divider(
                            endIndent: 220,
                          ),

                          charInfo(
                              title: "Seasons : ",
                              value: character!.appearance!.join("/")
                          ),
                          divider(
                            endIndent: 250,
                          ),

                          charInfo(
                              title: "Status : ",
                              value: character!.status!
                          ),
                          divider(
                            endIndent: 270,
                          ),

                          character!.betterCallSaulAppearance!.isEmpty?Container():charInfo(
                              title: "Better Call Saul : ",
                              value: character!.betterCallSaulAppearance!.join("/")
                          ),
                          character!.betterCallSaulAppearance!.isEmpty?Container():divider(
                            endIndent: 200
                          ),

                          charInfo(
                              title: "Actor Name : ",
                              value: character!.portrayed!
                          ),
                          divider(
                            endIndent: 220,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 420.0,
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
