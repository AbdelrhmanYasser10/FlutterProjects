import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:facbook_app/screens/feed_screen/cubit/feed_cubit.dart';
import 'package:facbook_app/shared/data/data.dart';
import 'package:facbook_app/widgets/circle_button/circle_button.dart';
import 'package:facbook_app/widgets/create_post/create_post.dart';
import 'package:facbook_app/widgets/post_widget/post_widget.dart';
import 'package:facbook_app/widgets/stories_widget/stories_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';

// ignore: must_be_immutable
class FeedScreenAndroid extends StatefulWidget {
  @override
  _FeedScreenAndroidState createState() => _FeedScreenAndroidState();
}

class _FeedScreenAndroidState extends State<FeedScreenAndroid>
    with SingleTickerProviderStateMixin {
  TrackingScrollController scrollController = TrackingScrollController();

  late var tabController;

  @override
  void initState() {

    tabController = TabController(
      initialIndex: 0,
      length: 5,
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
    return  Scaffold(
      backgroundColor: Color.fromRGBO(240,242,245,1),
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                pinned: true,
                floating: true,
                title: Text(
                  'facebook',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
                bottom: TabBar(
                  indicatorPadding:
                  EdgeInsets.symmetric(horizontal: 15.0),
                  indicatorColor: Colors.blue,
                  labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  controller: tabController,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.blueGrey,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.home,
                        size: 30.0,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.group,
                        size: 30.0,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.ondemand_video_outlined,
                        size: 30.0,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.notifications_none,
                        size: 30.0,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.menu,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                actions: [
                  CircleButton(
                    icon: Icons.search,
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
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [
              BlocProvider(
                create: (context) =>
                FeedCubit()
                  ..loadPosts(),
                child: BlocConsumer<FeedCubit, FeedState>(
                  listener: (context, state) {
                    print(state);
                  },
                  builder: (context, state) {
                    return state is! FeedLoadedSuccessfully? Center(child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                    )): Scrollbar(
                      child: ListView.separated(
                        primary: false,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 2.0),
                        itemBuilder: (context, index) {
                          if(index == 0)
                            return   Container(
                              child: CreatePostWidget(
                                  currentUser: UserModel(
                                    name: 'Abdelrahman Yasser',
                                    imageUrl:
                                    "https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/241240979_899931050946642_4692395767168298174_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGAcUm9UIk9_cuLzdbOcCdqKmFdBF-oRdQqYV0EX6hF1IpzR5MfC3j-FsMv1uuqrBQgCOyeAYX0p6mtBwAgB41e&_nc_ohc=m7gqlITDql0AX85akC7&_nc_ht=scontent.fcai20-2.fna&oh=4b612d53b9150dfb21bbddeceee90a63&oe=613EF117",
                                  )),
                            );
                          else if (index == 1)
                            return Container(
                              padding:
                              const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                              child: Container(
                                child: Stories(
                                  currentUser: UserModel(
                                    name: 'Abdelrahman Yasser',
                                    imageUrl:
                                    "https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/241240979_899931050946642_4692395767168298174_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGAcUm9UIk9_cuLzdbOcCdqKmFdBF-oRdQqYV0EX6hF1IpzR5MfC3j-FsMv1uuqrBQgCOyeAYX0p6mtBwAgB41e&_nc_ohc=m7gqlITDql0AX85akC7&_nc_ht=scontent.fcai20-2.fna&oh=4b612d53b9150dfb21bbddeceee90a63&oe=613EF117",
                                  ),
                                ),
                              ),
                            );
                          else
                            return  PostWidget(post: posts[index - 2]);
                        },
                        itemCount: posts.length + 2,
                      ),
                    );
                  },
                ),
              ),
              Scaffold(),
              Scaffold(),
              Scaffold(),
              Scaffold(),
            ],
          ),
        ),
      ),
    );

  }
}

