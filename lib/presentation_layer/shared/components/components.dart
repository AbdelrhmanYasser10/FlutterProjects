import 'package:breaking_bad/data_layer/models/characters_model/character_model.dart';
import 'package:breaking_bad/presentation_layer/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: InkWell(
          onTap: (){},
          child: GridTile(
            child: Hero(
              tag: character.charId!,
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 100,
                child: character.image!.isNotEmpty
                    ? Center(
                      child: CircleAvatar(
                  radius: 85,
                        backgroundImage: NetworkImage("${character.image}"),
                      ),
                    )
                    : Center(child: CircularProgressIndicator(),),
              ),
            ),
            footer: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.name}',
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}