import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix_ui_app/models/models.dart';
import 'package:netflix_ui_app/screens/product_screen.dart';


class HomeScreen extends StatefulWidget {
  static double opacityLevel = 0.0;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular on Netflix',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Oswald',
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviesScreen(
                                        imgLink: popularMovies[index]
                                            ['image'],
                                        name: popularMovies[index]['name'],
                                        rating: popularMovies[index]
                                            ['rating'],
                                        releaseYear: popularMovies[index]
                                            ['date'],
                                        description: popularMovies[index]
                                            ['description'],
                                        age:popularMovies[index]
                                        ['age'],
                                    type: popularMovies[index]
                                    ['type'],
                                      )));
                        });
                        setState(() {
                          HomeScreen.opacityLevel = 1.0;
                        });
                      },
                      child: getPopularMovies(index: index)),
                  itemCount: popularMovies.length,
                )),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Children & Family',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Oswald',
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoviesScreen(
                                        imgLink: comedyAndFamilyMovies[index]
                                            ['image'],
                                        name: comedyAndFamilyMovies[index]
                                            ['name'],
                                        rating: comedyAndFamilyMovies[index]
                                            ['rating'],
                                        releaseYear: comedyAndFamilyMovies[index]
                                            ['date'],
                                        description: comedyAndFamilyMovies[index]
                                            ['description'],
                                          age:comedyAndFamilyMovies[index]
                                          ['age'],
                                        type: comedyAndFamilyMovies[index]
                                        ['type'],

                                      )));
                        });
                        setState(() {
                          HomeScreen.opacityLevel = 1.0;
                        });
                      },
                      child: getChildrenAndFamilyMovies(index: index)),
                  itemCount: comedyAndFamilyMovies.length,
                )),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Action & Adventure',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Oswald',
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoviesScreen(
                                        imgLink: actionAndAdventure[index]
                                        ['image'],
                                        name: actionAndAdventure[index]
                                        ['name'],
                                        rating: actionAndAdventure[index]
                                        ['rating'],
                                        releaseYear: actionAndAdventure[index]
                                        ['date'],
                                        description: actionAndAdventure[index]
                                        ['description'],
                                        age: actionAndAdventure[index]
                                        ['age'],
                                          type:actionAndAdventure[index]
                                          ['type']
                                      )));
                        });
                        setState(() {
                          HomeScreen.opacityLevel = 1.0;
                        });
                      },
                      child: getActionAndAdventureMovies(index: index)),
                  itemCount: actionAndAdventure.length,
                )),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Horror',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Oswald',
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoviesScreen(
                                        imgLink: horrorMovies[index]
                                        ['image'],
                                        name: horrorMovies[index]
                                        ['name'],
                                        rating: horrorMovies[index]
                                        ['rating'],
                                        releaseYear: horrorMovies[index]
                                        ['date'],
                                        description: horrorMovies[index]
                                        ['description'],
                                        age: horrorMovies[index]
                                        ['age'],
                                        type:horrorMovies[index]
                                        ['type'] ,
                                      )));
                        });
                        setState(() {
                          HomeScreen.opacityLevel = 1.0;
                        });
                      },
                      child: getHorrorMovies(index: index)),
                  itemCount: horrorMovies.length,
                )),
          ],
        ),
      ),
    );
  }
}
