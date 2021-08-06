import 'package:breaking_bad/business_logic_layer/cubit/characters_cubit/characters_cubit.dart';
import 'package:breaking_bad/data_layer/repository/characters_repository/characters_repository.dart';
import 'package:breaking_bad/data_layer/web_server/characters_web_services/characters_web_servcies.dart';
import 'package:breaking_bad/presentation_layer/modules/character_details/character_details.dart';
import 'package:breaking_bad/presentation_layer/modules/characters_screen/characters_screen.dart';
import 'package:breaking_bad/presentation_layer/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter{
  CharactersRepository?  charactersRepository;
  CharactersCubit? charactersCubit;
  AppRouter(){
    this.charactersRepository = CharactersRepository(characterWebServices: CharacterWebServices());
    this.charactersCubit = CharactersCubit(this.charactersRepository!);
  }

  Route? generateRoute(RouteSettings settings){
      switch(settings.name){
        case charactersScreen:
            return MaterialPageRoute(builder: (context)=>BlocProvider(create: (context)=>CharactersCubit(this.charactersRepository!),child: CharactersScreen()));

        case charactersDetailsScreen:
          return MaterialPageRoute(builder: (context)=>CharacterDetailsScreen());

      }
  }

}