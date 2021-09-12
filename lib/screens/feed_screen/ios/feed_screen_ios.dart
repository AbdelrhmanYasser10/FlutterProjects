import 'package:facbook_app/models/post_model/post_model.dart';
import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:facbook_app/screens/feed_screen/cubit/feed_cubit.dart';
import 'package:facbook_app/shared/data/data.dart';
import 'package:facbook_app/widgets/circle_button/circle_button.dart';
import 'package:facbook_app/widgets/create_post/create_post.dart';
import 'package:facbook_app/widgets/post_widget/post_widget.dart';
import 'package:facbook_app/widgets/rooms_widget/rooms_widget.dart';
import 'package:facbook_app/widgets/stories_widget/stories_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';

// ignore: must_be_immutable
class FeedScreenIOS extends StatefulWidget {
  @override
  _FeedScreenIOSState createState() => _FeedScreenIOSState();
}

class _FeedScreenIOSState extends State<FeedScreenIOS>
    with SingleTickerProviderStateMixin {
  TrackingScrollController scrollController = TrackingScrollController();

  late var tabController;

  @override
  void initState() {
    /*
    * in IOS There is 6 tabs
    * in Android There is 5 tabs*/

    tabController = TabController(
      initialIndex: 0,
      length: 6,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Handling if we run on ios or android that there is a difference between two screens

    return BlocProvider(
      create: (context) =>
      FeedCubit()
        ..loadPosts(),
      child: BlocConsumer<FeedCubit, FeedState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: Text(
                'facebook',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              centerTitle: false,
              actions: [
                CircleButton(
                  icon: CupertinoIcons.search,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
                CircleButton(
                  icon: Mdi.facebookMessenger,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(240, 242, 245, 1),
            bottomNavigationBar: Container(
              color: Colors.white,
              child: TabBar(
                onTap: (index) {
                  //tabController.selectedIndex = getFeedCubit.currentIndexIOS;
                },
                indicatorPadding: EdgeInsets.symmetric(horizontal: 2.0),
                indicatorColor: Colors.blue,
                labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                indicator: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.blue,
                      width: 3.0,
                    ),
                  ),
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
                controller: tabController,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.blueGrey.shade800,
                labelStyle: TextStyle(
                    fontSize: 10.0, fontWeight: FontWeight.w500),
                tabs: [
                  Tab(
                    text: "News Feed",
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                  ),
                  Tab(
                    text: "Friends",
                    icon: Icon(
                      Icons.group_outlined,
                      size: 30,
                    ),
                  ),
                  Tab(
                    text: "Watch",
                    icon: Icon(
                      Icons.ondemand_video_outlined,
                      size: 30,
                    ),
                  ),
                  Tab(
                    text: "Groups",
                    icon: Icon(
                      CupertinoIcons.group,
                      size: 30,
                    ),
                  ),
                  Tab(
                    text: "Notifications",
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30,
                    ),
                  ),
                  Tab(
                    text: "Menu",
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
                child: TabBarView(
                  controller: tabController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    CustomScrollView(
                      controller: scrollController,
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: CreatePostWidget(
                              currentUser: UserModel(
                                name: 'Abdelrahman Yasser',
                                imageUrl:
                                "https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/241240979_899931050946642_4692395767168298174_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGAcUm9UIk9_cuLzdbOcCdqKmFdBF-oRdQqYV0EX6hF1IpzR5MfC3j-FsMv1uuqrBQgCOyeAYX0p6mtBwAgB41e&_nc_ohc=m7gqlITDql0AX85akC7&_nc_ht=scontent.fcai20-2.fna&oh=4b612d53b9150dfb21bbddeceee90a63&oe=613EF117",
                              )),
                        ),
                        SliverPadding(
                          padding:
                          const EdgeInsets.only(top: 10.0, bottom: 5.0),
                          sliver: SliverToBoxAdapter(
                            child: Rooms(),
                          ),
                        ),
                        SliverPadding(
                          padding:
                          const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          sliver: SliverToBoxAdapter(
                            child: Stories(
                              currentUser: UserModel(
                                name: 'Abdelrahman Yasser',
                                imageUrl:
                                "https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/241240979_899931050946642_4692395767168298174_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGAcUm9UIk9_cuLzdbOcCdqKmFdBF-oRdQqYV0EX6hF1IpzR5MfC3j-FsMv1uuqrBQgCOyeAYX0p6mtBwAgB41e&_nc_ohc=m7gqlITDql0AX85akC7&_nc_ht=scontent.fcai20-2.fna&oh=4b612d53b9150dfb21bbddeceee90a63&oe=613EF117",
                              ),
                            ),
                          ),
                        ),
                        state is FeedLoadedSuccessfully
                            ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              PostModel post = posts[index];
                              return PostWidget(post: post);
                            },
                            childCount: posts.length,
                          ),
                        )
                            : SliverToBoxAdapter(
                          child: Center(
                            child: CupertinoActivityIndicator(),
                         ),
                        ),
                      ],
                    ),
                    Scaffold(),
                    Scaffold(),
                    Scaffold(),
                    Scaffold(),
                    Scaffold(),
                  ],
                )),
          );
        },
      ),
    );
  }
}
