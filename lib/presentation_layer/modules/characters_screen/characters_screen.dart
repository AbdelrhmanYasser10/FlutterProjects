import 'package:breaking_bad/business_logic_layer/cubit/characters_cubit/characters_cubit.dart';
import 'package:breaking_bad/business_logic_layer/cubit/characters_cubit/characters_state.dart';
import 'package:breaking_bad/data_layer/models/characters_model/character_model.dart';
import 'package:breaking_bad/presentation_layer/shared/colors/colors.dart';
import 'package:breaking_bad/presentation_layer/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allCharacters = [];
  late List<Character> searchedAllCharacters;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchController.text.isEmpty?allCharacters.length:searchedAllCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(character: searchController.text.isEmpty?allCharacters[index]:searchedAllCharacters[index]);
      },
    );
  }

  Widget buildSearch() {
    return TextFormField(
      controller: searchController,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: "Find a character",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
      onChanged: (value) {
        addSearchedOrItemToSearchedList(value);
      },
    );
  }

  void addSearchedOrItemToSearchedList(String searchChar) {
    searchedAllCharacters = allCharacters
        .where(
            (character) => character.name!.toLowerCase().startsWith(searchChar))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearch,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            )),
      ];
    }
  }

  void startSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: stopSearch,
    ));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch(){
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch(){
    setState(() {
      searchController.clear();
    });
  }

  Widget appBarTitle(){
    return Text(
      'Characters',
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading:isSearching?BackButton(
          color: Colors.white,
        ):SizedBox(),
        title: isSearching?buildSearch():appBarTitle(),
        actions: buildAppBarActions(),
      ),
      backgroundColor: backgroundColor,
      body: buildBlocWidget(),
    );
  }
}
