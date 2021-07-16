import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            HexColor('#212121'),
            HexColor('#121212'),
          ],
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: HexColor('121212'),
          selectedItemColor: HexColor('#1DB954'),
          selectedIconTheme: IconThemeData(
            color: HexColor('1DB954'),

          ),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.home,
                ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.search,
                  color: Colors.grey,
                ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music,
                color: Colors.grey,
              ),
              label: 'Library'
            ),
            /*BottomNavigationBarItem(
                icon:
                Image.network
                  (
                    'https://icons-for-free.com/iconfiles/png/512/part+1+spotify-1320568370204385476.png',
                  color: Colors.grey,
                  fit: BoxFit.cover,
                ),
              label: 'Premium'
            ),*/
          ],
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Good evening',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_backup_restore_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image(
                                width: 50,
                                image: NetworkImage(
                                  'https://i.scdn.co/image/ab67706f00000003be22f736837b81346bbfa31f',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Rap Egypt',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image(
                                width: 50,
                                image: NetworkImage(
                                  'https://lastfm.freetls.fastly.net/i/u/770x0/17d24abfd601a8e08fe35d5ce23c15fb.jpg',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Marwan Pablo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image(
                                width: 50,
                                image: NetworkImage(
                                  'https://campaignme.com/wp-content/uploads/2020/12/Spotify-Wrapped-2020.jpg',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Top Tracks',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image(
                                width: 50,
                                image: NetworkImage(
                                  'https://i.scdn.co/image/ab67706f000000035ea9026b602deaaa48a4d1f0',
                                ),
                              ),
                              Spacer(),
                              Flexible(
                                child: Text(
                                  'Best Arabic Hits 2020',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image(
                                width: 50,
                                image: NetworkImage(
                                  'https://flair-magazine.com/wp-content/uploads/2020/12/Top-Tracks-2020-Egypt_-Wegz--1024x1024.jpg',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Top Egypt',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image(
                                width: 50,
                                image: NetworkImage(
                                  'https://i.scdn.co/image/6ba76046617d6bd8dcd4f82c2d11608da56fe971',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Wegz',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recently Played',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200.0,
                        child: Row(
                          children: [
                            Expanded(
                              child:ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 10,
                                separatorBuilder: (context,index)=>SizedBox(
                                  width: 20.0,
                                ),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: 150.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              HexColor('#1DB954'),
                                              HexColor('#191414'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        'Music Name',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recommended',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200.0,
                        child: Row(
                          children: [
                            Expanded(
                              child:ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 10,
                                separatorBuilder: (context,index)=>SizedBox(
                                  width: 20.0,
                                ),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: 150.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              HexColor('#fd4f7b'),
                                              HexColor('#c6edee'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        'Music Name',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
