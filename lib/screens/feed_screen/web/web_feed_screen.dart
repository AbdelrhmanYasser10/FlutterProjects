import 'package:facbook_app/models/post_model/post_model.dart';
import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:facbook_app/screens/feed_screen/cubit/feed_cubit.dart';
import 'package:facbook_app/shared/data/data.dart';
import 'package:facbook_app/widgets/circle_button/circle_button.dart';
import 'package:facbook_app/widgets/contact_list/contact_list.dart';
import 'package:facbook_app/widgets/create_post/create_post.dart';
import 'package:facbook_app/widgets/more_options_list/more_options_list.dart';
import 'package:facbook_app/widgets/post_widget/post_widget.dart';
import 'package:facbook_app/widgets/rooms_widget/rooms_widget.dart';
import 'package:facbook_app/widgets/stories_widget/stories_widget.dart';
import 'package:facbook_app/widgets/user_card/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';


// ignore: must_be_immutable
class WebFeedScreen extends StatefulWidget {
  @override
  _WebFeedScreenState createState() => _WebFeedScreenState();
}

class _WebFeedScreenState extends State<WebFeedScreen> with SingleTickerProviderStateMixin {

  //current User for this application
  UserModel currentUser = UserModel(name: 'Abdelrahman Yasser',
      imageUrl: 'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/241240979_899931050946642_4692395767168298174_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGAcUm9UIk9_cuLzdbOcCdqKmFdBF-oRdQqYV0EX6hF1IpzR5MfC3j-FsMv1uuqrBQgCOyeAYX0p6mtBwAgB41e&_nc_ohc=tIPyYc0q1hwAX8DBndM&_nc_ht=scontent-hbe1-1.xx&oh=c45bfc5c7d7d1373ce4564d939060fa5&oe=6142E597');
  var tabController;

  @override
  void initState() {
    //*/***Initialize TabController for the TabBar in the appbar of the web//*
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  //*Special Web Appbar////
  AppBar webAppBar({
    required context,
  }) =>
      AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 65.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediaQuery
                  .of(context)
                  .size
                  .width >= 1024 ? Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade300,
                              Colors.blue.shade400,
                              Colors.blue.shade600,
                              Colors.blue.shade800,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          shape: BoxShape.circle
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 22.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'f',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 38.0
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    MediaQuery
                        .of(context)
                        .size
                        .width >= 1024 ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 8.0
                      ),
                      child: Container(
                        width: 220.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 242, 245, 1),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Search Facebook",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 6.0
                              ),
                              child: Icon(CupertinoIcons.search, size: 25.0,),
                            ),
                          ),
                        ),
                      ),
                    ) : Container(),
                  ],
                ),
              ) : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade300,
                        Colors.blue.shade400,
                        Colors.blue.shade600,
                        Colors.blue.shade800,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    shape: BoxShape.circle
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 22.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'f',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 38.0
                      ),
                    ),
                  ),
                ),
              ),
              MediaQuery
                  .of(context)
                  .size
                  .width >= 1024 ? SizedBox(
                width: 10.0,
              ) : Container(
                width: 25.0,
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: 600.0,
                  child: TabBar(
                    controller: tabController,
                    unselectedLabelColor: Colors.blueGrey,
                    labelColor: Colors.blue,
                    indicatorPadding: EdgeInsets.symmetric(
                        vertical: 5.0
                    ),
                    indicator: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.blue,
                                width: 3.0
                            )
                        )
                    ),
                    tabs: [
                      Tab(
                        icon: Icon(Icons.home, size: 30.0,),
                      ),
                      Tab(
                        icon: Icon(Icons.group_outlined, size: 30.0,),
                      ),
                      Tab(
                        icon: Icon(Icons.ondemand_video, size: 30.0,),
                      ),
                      Tab(
                        icon: Icon(CupertinoIcons.group, size: 30.0,),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Flex(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  direction: Axis.horizontal,
                  children: [
                    MediaQuery
                        .of(context)
                        .size
                        .width >= 1024 ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0
                      ),
                      child: InkWell(
                        child: userCard(user: currentUser, isTop: true),
                      ),
                    ) : Container(),
                    MediaQuery
                        .of(context)
                        .size
                        .width >= 1024 ? SizedBox(width: 6.0) : Container(),
                    CircleButton(
                      icon: Icons.search,
                      iconSize: 30.0,
                      onPressed: () => print('Search'),
                    ),
                    CircleButton(
                      icon: Mdi.facebookMessenger,
                      iconSize: 30.0,
                      onPressed: () => print('Messenger'),
                    ),
                    CircleButton(
                      icon: Icons.notifications_none,
                      iconSize: 30.0,
                      onPressed: () => print('Notification'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  /*Any InlineIfConditions Using in this Widget is only for make sure the page is responsive on tablet mode or Web mode*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) =>
      FeedCubit()
        ..loadPosts(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 242, 245, 1),
        appBar: webAppBar(context: context),
        body: TabBarView(
          controller: tabController,
          children: [
            Row(
              children: [
                MediaQuery
                    .of(context)
                    .size
                    .width >= 1024 ? Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: MoreOptionsList(currentUser: currentUser)
                    ),
                  ),
                ) : Container(width: 15.0,),
                MediaQuery
                    .of(context)
                    .size
                    .width >= 1024 ? Spacer() : Container(),
                MediaQuery
                    .of(context)
                    .size
                    .width >= 1024 ? Container(
                  width: 600.0,
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(
                            0.0, 20.0, 0.0, 10.0),
                        sliver: SliverToBoxAdapter(
                          child: Stories(
                            currentUser: currentUser,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CreatePostWidget(currentUser: currentUser),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(
                            0.0, 10.0, 0.0, 5.0),
                        sliver: SliverToBoxAdapter(
                          child: Rooms(),
                        ),
                      ),
                      BlocConsumer<FeedCubit, FeedState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return state is FeedLoadPosts
                              ? SliverToBoxAdapter(child: Center(
                            child: LinearProgressIndicator(),))
                              : SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                PostModel post = posts[index];
                                return PostWidget(post: post);
                              },
                              childCount: posts.length,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ) : Expanded(child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                          0.0, 20.0, 0.0, 10.0),
                      sliver: SliverToBoxAdapter(
                        child: Stories(
                          currentUser: currentUser,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CreatePostWidget(currentUser: currentUser),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                      sliver: SliverToBoxAdapter(
                        child: Rooms(),
                      ),
                    ),
                    BlocConsumer<FeedCubit, FeedState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        //call bloc to fetch posts
                        return state is FeedLoadPosts
                            ? SliverToBoxAdapter(
                            child: Center(child: LinearProgressIndicator(),))
                            : SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              PostModel post = posts[index];
                              return PostWidget(post: post);
                            },
                            childCount: posts.length,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                ),

                /*Keep Page Responsive to avoid any overflowing*/
                MediaQuery
                    .of(context)
                    .size
                    .width >= 1024 ? Spacer() : Container(),
                MediaQuery
                    .of(context)
                    .size
                    .width >= 1024 ? Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: contactsList(),
                    ),
                  ),
                ) : Container(),
              ],
            ),
            Scaffold(),
            Scaffold(),
            Scaffold(),
          ],
        ),
      ),
    );
  }
}