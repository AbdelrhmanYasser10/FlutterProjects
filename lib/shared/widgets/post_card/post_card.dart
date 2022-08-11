import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/modules/comments_screen/comments_screen.dart';
import 'package:instagram_clone/shared/colors/colors.dart';
import 'package:instagram_clone/shared/network/resources/fire_store_method/fire_store_method.dart';
import 'package:instagram_clone/shared/providers/user_provider/user_provider.dart';
import 'package:instagram_clone/shared/widgets/animation/animation.dart';
import 'package:instagram_clone/shared/widgets/toast/my_toast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../model/user_model/user_model.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({Key? key , required this.snap}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikedAnimated = false;
  int commentLen = 0;

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }
  void fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (err) {
      myToast(msg: err.toString(), color: Colors.red, txtColor: Colors.white);
    }
    setState(() {});
  }
  void deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      myToast(msg: err.toString(), color: Colors.red, txtColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 16.0,
            )..copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16.0,
                  backgroundImage: NetworkImage(
                    widget.snap['profImage'],
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.snap['username'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context) =>Dialog(
                            child: ListView(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              shrinkWrap: true,
                              children: [
                                "Delete",
                              ].map((e) =>InkWell(
                                onTap: (){
                                  deletePost(
                                    widget.snap['postId']
                                        .toString(),
                                  );
                                  // remove the dialog box
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12.0 , horizontal: 16.0),
                                  child: Text(e),
                                ),
                              )).toList(),
                            ),
                          )
                      );
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onDoubleTap: ()async{
              await FireStoreMethods().likePost(
                  postId: widget.snap['postId'],
                  uid: user.uid,
                  likes: widget.snap['likes'],
              );
              setState(() {
                isLikedAnimated = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.35,
                  width: double.infinity,
                  child: Image.network(
                    widget.snap['postUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikedAnimated ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikedAnimated,
                    duration: const Duration(milliseconds: 400),
                    onEnd: (){
                      setState(() {
                        isLikedAnimated = false;
                      });
                    },
                    child:  const Icon(Icons.favorite,color: Colors.white,size: 100.0,),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              LikeAnimation(
                isAnimating: widget.snap['likes'].contains(user.uid),
                child: IconButton(
                    onPressed: ()async{
                      await FireStoreMethods().likePost(
                        postId: widget.snap['postId'],
                        uid: user.uid,
                        likes: widget.snap['likes'],
                      );
                    },
                    icon: Icon(
                      widget.snap['likes'].contains(user.uid)?Icons.favorite:Icons.favorite_border,
                      color: widget.snap['likes'].contains(user.uid)?Colors.red: Colors.white,
                    ),
                ),
              ),
              IconButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CommentsScreen(postId: widget.snap['postId'])));
                  },
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: Colors.white,
                  ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.bookmark_outline,
                      color: Colors.white,
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding:  const EdgeInsets.symmetric(
              horizontal: 16.0
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                  child: Text(
                      '${widget.snap['likes'].length.toString()} likes',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:const EdgeInsets.only(top: 8.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: widget.snap['username'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' ${widget.snap['description']}',

                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CommentsScreen(
                      postId:widget.snap['postId'],
                      )));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                        'view all $commentLen comments',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: secondaryColor
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    DateFormat.yMMMd().format(widget.snap['datePublished'].toDate()),
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: secondaryColor
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
