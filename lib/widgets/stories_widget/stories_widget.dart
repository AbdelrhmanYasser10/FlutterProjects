import 'package:facbook_app/models/stories_model/stories_model.dart';
import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:facbook_app/shared/constants/constants.dart';
import 'package:facbook_app/shared/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final UserModel currentUser;

  const Stories({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 578;
    return Container(
      height: 200.0,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
        physics: getOS()=='ios'?BouncingScrollPhysics():ScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 8.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: StoryCardShape(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          } else {
            StoryModel storyModel = stories[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: StoryCardShape(story: storyModel),
            );
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class StoryCardShape extends StatelessWidget {
  bool isAddStory;
  UserModel? currentUser;
  StoryModel? story;

  StoryCardShape({
    Key? key,
    this.isAddStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 578;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 0.1),
                  blurRadius: 0.2,
                ),
              ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image(
                      image: NetworkImage(
                          isAddStory == true ? currentUser!.imageUrl! : story!
                              .imageUrl!),
                      width: 110.0,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  isAddStory == true ? SizedBox(
                    height: 10.0,
                  ):SizedBox(),
                  isAddStory == true ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 16.0
                      ),
                      child: Text(
                         'Create Story',
                        style: TextStyle(
                        color:  Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ):SizedBox(),
                ],
              ),
            ),
          ),
        /*
        * if it's the first one (that mean it is the current user) for that we will make the icon and adding it in the center
        * else we will make the gradient on the image to show user picture and text*/
        isAddStory == true?Container(
          margin: EdgeInsets.only(
            top: 200/2.4
          ),
          height: double.infinity,
          child: CircleAvatar(
            radius: 19.0,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.blue.shade700,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                icon:Icon(
                  getOS()=='ios'?CupertinoIcons.add : Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ):ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                vertical: 4.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: story!.isView? Colors.grey:Colors.blue,
                    radius: 16.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(story!.user!.imageUrl!),
                      radius: 13.0,
                    ),
                  ),
                  Spacer(),
                  Text(
                    story!.user!.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
