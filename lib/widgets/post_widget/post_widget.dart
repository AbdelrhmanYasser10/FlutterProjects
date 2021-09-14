import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:facbook_app/models/post_model/post_model.dart';
import 'package:facbook_app/screens/feed_screen/cubit/feed_cubit.dart';
import 'package:facbook_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';

// ignore: must_be_immutable
class PostWidget extends StatelessWidget {
  PostModel post;
  CarouselController buttonCarouselController = CarouselController();

  PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 578;
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: isDesktop ? 5.0 : 0.0,
      ),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  postHead(post: post),
                  SizedBox(height: 4.0),
                  Text(post.caption),
                  SizedBox(height: 6.0),
                ],
              ),
            ),
            post.imageUrl.isNotEmpty
                ? post.imageUrl.length > 1
                    ? Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CarouselSlider(
                                items: post.imageUrl.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Image(image: NetworkImage(i)),
                                      );
                                    },
                                  );
                                }).toList(),
                                carouselController: buttonCarouselController,
                                options: CarouselOptions(
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.9,
                                  initialPage: 1,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          buttonCarouselController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.linear),
                                      icon: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Icon(getOS() != 'ios'
                                              ? Icons.arrow_back
                                              : Icons.arrow_back_ios)),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () =>
                                          buttonCarouselController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.linear),
                                      icon: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Icon(getOS() != 'ios'
                                              ? Icons.arrow_forward
                                              : Icons.arrow_forward_ios)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Image(image: NetworkImage(post.imageUrl[0])),
                      )
                : Container(
                    height: 5.0,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: postStats(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

Widget postHead({required PostModel post}) => Row(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(post.user.imageUrl!)),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );

Widget postStats({required PostModel post}) => Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            BlocProvider(
              create: (context) => FeedCubit(),
              child: BlocConsumer<FeedCubit, FeedState>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  return postButton(
                    icon: Icon(
                      Mdi.thumbUpOutline,
                      color: post.isLiked ? Colors.blue : Colors.grey[600],
                      size: 20.0,
                    ),
                    label: 'Like',
                    onTap: () {
                      FeedCubit.get(context).changeLikeOnPost(postModel: post);
                    },
                    isLiked: post.isLiked,
                  );
                },
              ),
            ),
            postButton(
              icon: Icon(
                Mdi.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => print('Comment'),
            ),
            postButton(
              icon: Icon(
                Mdi.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap: () => print('Share'),
            )
          ],
        ),
      ],
    );

Widget postButton({
  required Icon icon,
  required String label,
  required VoidCallback onTap,
  bool? isLiked,
}) =>
    Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(
                  label,
                  style: TextStyle(
                    color: isLiked == true ? Colors.blue : Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
