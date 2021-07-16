import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui_app/screens/home_screen.dart';
import 'package:netflix_ui_app/screens/series_screen.dart';





List<Map> movies=[
  {
    'name':'Alive',
    'image':'https://m.media-amazon.com/images/M/MV5BZTMwNDUxNjItMDgzNS00MjU3LTllZTktOGVmZGM4N2FmYmYzXkEyXkFqcGdeQXVyNjEwNTM2Mzc@._V1_.jpg',
    'rating':'6.3',
    'date':'2020',
    'description':"As a grisly virus rampages a city, a lone man stays locked inside his apartment, digitally cut off from seeking help and desperate to find a way out.",
    'popular':'yes',
    'type':'Horror',
    'age':'+16',
  },
  {
    'name':'17 Again',
    'image':'https://m.media-amazon.com/images/M/MV5BMjA2NTI1Mzg3N15BMl5BanBnXkFtZTcwMjYwNjAzMg@@._V1_.jpg',
    'rating':'6.4',
    'date':'2009',
    'description':"Nearing a midlife crisis, thirty-something Mike wishes for a (do-over) -- and that's exactly what he gets when he wakes up to find he's 17 again.",
    'popular':'yes',
    'type':' Comedy',
    'age':'+13',
  },
  {
    'name':'01-Oct',
    'image':'https://m.media-amazon.com/images/M/MV5BMzQ1NzA4MTA4N15BMl5BanBnXkFtZTgwMzk1NzYzMDE@._V1_.jpg',
    'rating':'6.5',
    'date':'2014',
    'description':"Against the backdrop of Nigeria's looming independence from Britain, detective Danladi Waziri races to capture a killer terrorizing local women.",
    'popular':'yes',
    'type':' Crime',
    'age':'+18',
  },
  {
    'name':'Rucker50',
    'image':'https://m.media-amazon.com/images/M/MV5BNzBmNDU1OTEtNjFmNC00NTJiLWEzNmItMmViNDM1ZmFmNDQxL2ltYWdlXkEyXkFqcGdeQXVyNjIwNjMyMjY@._V1_.jpg',
    'rating':'5.3',
    'date':'2016',
    'description':"This documentary celebrates the 50th anniversary of the Harlem basketball tournament that turned city hoopers into local legends and professional stars.",
    'popular':'yes',
    'type':'Sports',
    'age':'+13',

  },
  {
    'name':'Wheelman',
    'image':'https://m.media-amazon.com/images/M/MV5BMjA3NjA0MzE1N15BMl5BanBnXkFtZTgwNjAzNzQ0MzI@._V1_.jpg',
    'rating':'6.4',
    'date':'2017',
    'description':"The getaway driver in a botched robbery puts his skills and smarts to the test when he receives shocking orders from an unknown caller.",
    'popular':'yes',
    'type':'Crime',
    'age':'+18',
  },

  {
    'name':'Home',
    'image':'https://m.media-amazon.com/images/M/MV5BMjExOTQ4MDMyMV5BMl5BanBnXkFtZTgwMTE3NDM2MzE@._V1_.jpg',
    'rating':'7.0',
    'date':'2015',
    'description':"A misfit alien named Oh moves in with Tip and her family, in a series that picks up the dynamic duo's adventures where the hit film left off..",
    'popular':'no',
    'type':'Children & Family Movies',
    'age':'+7',

  },
  {
    'name':'Enola Holmes',
    'image':'https://images-na.ssl-images-amazon.com/images/I/91v-jpsDmYL.jpg',
    'rating':'6.0',
    'date':'2020',
    'description':"When Enola Holmes-Sherlock's teen sister-discovers her mother missing, she sets off to find her, becoming a super-sleuth in her own right as she outwits her famous brother and unravels a dangerous conspiracy around a mysterious young Lord",
    'popular':'no',
    'type':'Children & Family Movies',
    'age':'+13',

  },
  {
    'name':'Minions',
    'image':'https://upload.wikimedia.org/wikipedia/en/4/45/Minions_The_Rise_of_Gru_poster.jpg',
    'rating':'6.5',
    'date':'2015',
    'description':"Minions Stuart, Kevin, and Bob are recruited by Scarlet Overkill, a supervillain who, alongside her inventor husband Herb, hatches a plot to take over the world.",
    'popular':'no',
    'type':'Children & Family Movies',
    'age':'+7',
  },
  {
    'name':'Love and Monsters',
    'image':'https://m.media-amazon.com/images/M/MV5BYWVkMWEyMDUtZTVmOC00MTYxLWE1ZTUtNjk4M2IzMjY2OTIxXkEyXkFqcGdeQXVyMDk5Mzc5MQ@@._V1_.jpg',
    'rating':'7.0',
    'date':'2021',
    'description':"Seven years after he survived the monster apocalypse, lovably hapless Joel leaves his cozy underground bunker behind on a quest to reunite with his ex.",
    'popular':'no',
    'type':'Children & Family Movies',
    'age':'+13',

  },
  {
    'name':'The SpongeBob Movie: Sponge on the Run',
    'image':'https://m.media-amazon.com/images/M/MV5BOGYxYzZkMWQtNjJkMy00NTlkLWExNWMtOTNhMTg4MDcxNmU3XkEyXkFqcGdeQXVyMDk5Mzc5MQ@@._V1_.jpg',
    'rating':'6.4',
    'date':'2020',
    'description':"After SpongeBob's beloved pet snail Gary is snail-napped, he and Patrick embark on an epic adventure to The Lost City of Atlantic City to bring Gary home.",
    'popular':'no',
    'type':'Children & Family Movies',
    'age':'+7',
  },
  {
    'name':'Hotel Transylvania 2',
    'image':'https://m.media-amazon.com/images/M/MV5BNThkYmNmYzAtOGI2Ny00ODI4LTgwY2MtZmY3YWMxYTUyYjVjXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_.jpg',
    'rating':'6.7',
    'date':'2015',
    'description':"Dracula and his friends try to bring out the monster in his half human, half vampire grandson in order to keep Mavis from leaving the hotel.",
    'popular':'no',
    'type':'Children & Family Movies',
    'age':'+7',

  },
  {
    'name':'How to Train Your Dragon',
    'image':'https://i.pinimg.com/736x/47/14/04/471404ad87148eb3d3a0be245a61ca24.jpg',
    'rating':'6.7',
    'date':'2010',
    'description':"A hapless young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and learns there may be more to the creatures than he assumed.",
    'popular':'no',
    'type':'Children & Family Movies',
    'age':'+7',

  },
  {
    'name':'Journey 2: The Mysterious Island',
    'image':'https://m.media-amazon.com/images/M/MV5BMjA5MTE1MjQyNV5BMl5BanBnXkFtZTcwODI4NDMwNw@@._V1_UY1200_CR90,0,630,1200_AL_.jpg',
    'rating':'6.5',
    'date':'2012',
    'description':"Sean Anderson partners with his mom's husband on a mission to find his grandfather, who is thought to be missing on a mythical island.",
    'popular':'no',
    'type':'Children & Family Movies',
    'age':'+13',
  },

  {
    'name':'Fast & Furious Presents: Hobbs & Shaw',
    'image':'https://m.media-amazon.com/images/M/MV5BMTc4NzA5MTgwMl5BMl5BanBnXkFtZTgwNjA2MjIzNzM@._V1_.jpg',
    'rating':'6.4',
    'date':'2019',
    'description':"When US agent Luke Hobbs is sent to England to stop a deadly biothreat, he's forced to team up with his nemesis, mercenary Deckard Shaw.",
    'popular':'no',
    'type':'Action & Adventure',
    'age':'+13',
  },

  {
    'name':'Venom',
    'image':'https://m.media-amazon.com/images/M/MV5BNzAwNzUzNjY4MV5BMl5BanBnXkFtZTgwMTQ5MzM0NjM@._V1_UY1200_CR90,0,630,1200_AL_.jpg',
    'rating':'6.7',
    'date':'2018',
    'description':"A reporter battles a mad scientist in a fight for his life after merging with a snarky alien symbiote that gives him remarkable superpowers..",
    'popular':'no',
    'type':'Action & Adventure',
    'age':'+16',
  },

  {
    'name':'Spider-Man: Homecoming',
    'image':'https://m.media-amazon.com/images/M/MV5BOGQ5YTM3YzctOTVmMC00OGIyLWFkZTYtMWYwOWZhMjA2MWMwXkEyXkFqcGdeQXVyMjUyMTE5MA@@._V1_.jpg',
    'rating':'5.7',
    'date':'2017',
    'description':"Peter Parker returns to routine life as a high schooler until the Vulture's arrival gives him the chance to prove himself as a web-slinging superhero.",
    'popular':'no',
    'type':'Action & Adventure',
    'age':'+13',
  },
  {
    'name':'Godzilla',
    'image':'https://m.media-amazon.com/images/M/MV5BZDFmYTM4NzAtNWM0ZC00MGJlLWEyYzQtYzA3ZTFiNzc1YjllXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg',
    'rating':'6.4',
    'date':'2014',
    'description':"Years after a nuclear disaster tore their family apart, a father and son reunite just as Godzilla re-emerges to battle beasts that threaten humanity.",
    'popular':'no',
    'type':'Action & Adventure',
    'age':'+13',
  },
  {
    'name':'Taken 2',
    'image':'https://m.media-amazon.com/images/M/MV5BMTkwNTQ0ODExOV5BMl5BanBnXkFtZTcwNjU3NDQwOA@@._V1_.jpg',
    'rating':'6.3',
    'date':'2012',
    'description':"Retired special ops agent Bryan Mills turns the tables on his abductors when they seek revenge for the deaths of his daughter's Albanian kidnappers.",
    'popular':'no',
    'type':'Action & Adventure',
    'age':'+18',
  },
  {
    'name':'The Dark Knight',
    'image':'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
    'rating':'9.0',
    'date':'2008',
    'description':"As Batman, Lt. Gordon and the district attorney continue to dismantle Gotham's criminal underground, a new villain threatens to undo their good work.",
    'popular':'no',
    'type':'Action & Adventure',
    'age':'+16',
  },

  {
    'name':'Deep Blue Sea',
    'image':'https://m.media-amazon.com/images/M/MV5BZWM0NjVkOGYtMjk5Mi00NGVmLWE3NDMtMDQ3ZjdjMDcwYzdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg',
    'rating':'5.9',
    'date':'2008',
    'description':"Scientists conduct research on sharks, hoping for a cure for Alzheimer's disease. But the tests go wrong, and the sharks are now deadlier than ever.",
    'popular':'no',
    'type':'Horror',
    'age':'+18',
  },

  {
    'name':'Ravenous',
    'image':'https://occ-0-299-300.1.nflxso.net/art/43fcc/d8aeeec8fbb3c8dc9485986c62cbd12990243fcc.jpg',
    'rating':'5.9',
    'date':'2017',
    'description':"As a zombie plague ravages their rural Quebec town, a scrappy band of survivors join forces to flee the infected hordes in this quiet thriller.",
    'popular':'no',
    'type':'Horror',
    'age':'+18',
  },
  {
    'name':'Resident Evil: The Final Chapter',
    'image':'https://m.media-amazon.com/images/M/MV5BMTc0Mzc2OTQ0Ml5BMl5BanBnXkFtZTgwOTQ5MjE4MDI@._V1_.jpg',
    'rating':'5.5',
    'date':'2016',
    'description':"Alice fights to get to Raccoon City and obtain a crucial antivirus, but Dr. Isaacs, Umbrella Corp. and hordes of violent zombies all stand in her way.",
    'popular':'no',
    'type':'Horror',
    'age':'+18',
  },

  {
    'name':'Underworld: Blood Wars',
    'image':'https://m.media-amazon.com/images/M/MV5BMjI5Njk0NTIyNV5BMl5BanBnXkFtZTgwNjU4MjY5MDI@._V1_.jpg',
    'rating':'5.8',
    'date':'2016',
    'description':"While striving to keep her daughter safe, vampire \"death dealer\" Selene battles Marius, a fearsome Lycan, and the villainous vampire, Semira.",
    'popular':'no',
    'type':'Horror',
    'age':'+18',
  },

  {
    'name':'The Conjuring',
    'image':'https://m.media-amazon.com/images/M/MV5BMTM3NjA1NDMyMV5BMl5BanBnXkFtZTcwMDQzNDMzOQ@@._V1_.jpg',
    'rating':'7.5',
    'date':'2013',
    'description':"Paranormal investigators Ed and Lorraine Warren work to help a family terrorized by a dark presence in their farmhouse.",
    'popular':'no',
    'type':'Horror',
    'age':'+18',
  },
];

List<Map> series =[
  {
    'name':'Money Heist',
    'image':'https://img.reelgood.com/content/show/a1690196-5da4-447b-85c8-bf1e799dd465/poster-780.webp',
    'rating':'8.4',
    'date':'2017',
    'Number-of-seasons':'',
    'Total-Number-Episodes':'',
    'description':'',
  },
  {
    'name':'Breaking Bad',
    'image':'https://img.reelgood.com/content/show/f75762df-3e5b-4cd3-b621-32399a3dd20d/poster-780.webp',
    'rating':'9.4',
    'date':'2008',
    'Number-of-seasons':'',
    'Total-Number-Episodes':'',
    'description':'',
  },
  {
    'name':'Dark',
    'image':'https://img.reelgood.com/content/show/b9802965-16f0-4d3f-9b2c-891656532924/poster-780.webp',
    'rating':'8.8',
    'date':'2017',
    'Number-of-seasons':'',
    'Total-Number-Episodes':'',
    'description':'',
  },
  {
    'name':'Peaky Blinders',
    'image':'https://img.reelgood.com/content/show/a51d1ed5-3b87-4466-ae64-7379934703aa/poster-780.webp',
    'rating':'8.8',
    'date':'2013',
    'Number-of-seasons':'',
    'Total-Number-Episodes':'',
    'description':'',
  },
  {
    'name':'Stranger Things',
    'image':'https://img.reelgood.com/content/show/244c3e6a-0057-4354-b535-8b52fd83c3e1/poster-780.webp',
    'rating':'8.7',
    'date':'2016',
    'Number-of-seasons':'',
    'Total-Number-Episodes':'',
    'description':'',
  },
];

class ScreensModel {
  static int index = 0;
  static List<Widget> screens = [
    HomeScreen(),
    SeriesScreen(),
  ];
}

List<Map> popularMovies = [];
List<Map> comedyAndFamilyMovies=[];
List<Map> actionAndAdventure=[];
List<Map> horrorMovies=[];

void initPopularMovies(){
  for(int i = 0 ;i<movies.length;i++){
    if(movies[i]['popular']=='yes'){
      popularMovies.add(movies[i]);
    }
  }
}

void initFamilyAndChildrenMovies(){

  for(int i = 0 ; i<movies.length;i++){
    if(movies[i]['type']=='Children & Family Movies'){
      comedyAndFamilyMovies.add(movies[i]);
    }
  }

}

void initActionAndAdventureMovies(){

  for(int i = 0 ; i<movies.length;i++){
    if(movies[i]['type']=='Action & Adventure'){
      actionAndAdventure.add(movies[i]);
    }
  }

}

void initHorrorMovies(){
  for(int i = 0 ; i < movies.length ; i++){
    if(movies[i]['type'] == 'Horror'){
      horrorMovies.add(movies[i]);
    }
  }
}

void initAllMoviesAndSeries(){
  initPopularMovies();
  initFamilyAndChildrenMovies();
  initActionAndAdventureMovies();
  initHorrorMovies();
}

Widget getPopularMovies({@required int index,
})=>Padding(

  padding: const EdgeInsets.all(5.0),
  child:   Container(

    width: 110,
    height: 195,
    child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,

        mainAxisSize: MainAxisSize.max,

        children: [

          Image

            (

              width: 106.5,

              height:149.25,

              image:NetworkImage('${popularMovies[index]['image']}'),
              fit: BoxFit.fill,

          ),

          SizedBox(
            height: 10.0,
          ),
        ],

      ),
  ),
);


Widget getChildrenAndFamilyMovies({@required int index
})=>Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Container(
    width: 110,
    height: 165,
    child:   Column(

      crossAxisAlignment: CrossAxisAlignment.center,

      mainAxisSize: MainAxisSize.max,

      children: [

        Image

          (

          width: 106.5,

          height:149.25,

          image:NetworkImage('${comedyAndFamilyMovies[index]['image']}'),
          fit: BoxFit.fill,

        ),

        SizedBox(
          height: 10.0,
        ),
      ],

    ),

  ),
);

Widget getActionAndAdventureMovies({@required int index
})=>Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Container(
    width: 110,
    height: 165,
    child:   Column(

      crossAxisAlignment: CrossAxisAlignment.center,

      mainAxisSize: MainAxisSize.max,

      children: [

        Image

          (

          width: 106.5,

          height:149.25,

          image:NetworkImage('${actionAndAdventure[index]['image']}'),
          fit: BoxFit.fill,

        ),

        SizedBox(
          height: 10.0,
        ),
      ],

    ),

  ),
);

Widget getHorrorMovies({@required int index
})=>Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Container(
    width: 110,
    height: 165,
    child:   Column(

      crossAxisAlignment: CrossAxisAlignment.center,

      mainAxisSize: MainAxisSize.max,

      children: [

        Image

          (

          width: 106.5,

          height:149.25,

          image:NetworkImage('${horrorMovies[index]['image']}'),
          fit: BoxFit.fill,

        ),

        SizedBox(
          height: 10.0,
        ),
      ],

    ),

  ),
);

Widget getTopSeries({@required int index
})=>Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Container(
    width: 110,
    height: 195,
    child:   Column(

      crossAxisAlignment: CrossAxisAlignment.center,

      mainAxisSize: MainAxisSize.max,

      children: [

        Image

          (

          width: 106.5,

          height:149.25,

          image:NetworkImage('${series[index]['image']}'),
          fit: BoxFit.cover,

        ),

        SizedBox(
          height: 10.0,
        ),
      ],

    ),

  ),
);