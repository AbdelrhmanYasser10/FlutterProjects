import 'package:bloc/bloc.dart';
import 'package:facbook_app/models/post_model/post_model.dart';
import 'package:facbook_app/models/user_model/user_model.dart';
import 'package:facbook_app/shared/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedInitial());


  static FeedCubit get(context)=>BlocProvider.of(context);

  List<PostModel> fetchedData = [
    PostModel(
      user: UserModel(name: 'Abdelrahman Yasser', imageUrl: "https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/241240979_899931050946642_4692395767168298174_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGAcUm9UIk9_cuLzdbOcCdqKmFdBF-oRdQqYV0EX6hF1IpzR5MfC3j-FsMv1uuqrBQgCOyeAYX0p6mtBwAgB41e&_nc_ohc=tIPyYc0q1hwAX8GMUz_&_nc_ht=scontent.fcai20-1.fna&oh=f982e29055704063d948b6ca7d3a56a8&oe=6140EB57"),
      caption: 'Check out these cool puppers',
      timeAgo: '58m',
      imageUrl: [
        'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
      ],
      likes: 1202,
      comments: 184,
      shares: 96,
      isLiked: false,
    ),
    PostModel(
      user: users[5],
      caption:
      'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      timeAgo: '3hr',
      imageUrl: [],
      likes: 683,
      comments: 79,
      shares: 18,
      isLiked: false,
    ),
    PostModel(
      user: users[4],
      caption: 'This is a very good boi.',
      timeAgo: '8hr',
      imageUrl:
      ['https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',],
      likes: 894,
      comments: 201,
      shares: 27,
      isLiked: false,
    ),
    PostModel(
      user: users[3],
      caption: 'Adventure 🏔',
      timeAgo: '15hr',
      imageUrl:
      ['https://images.unsplash.com/photo-1573331519317-30b24326bb9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
        'https://images.unsplash.com/photo-1542359649-31e03cd4d909?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWR2ZW50dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
        'https://images.unsplash.com/photo-1517960413843-0aee8e2b3285?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGFkdmVudHVyZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'
      ],
      likes: 722,
      comments: 183,
      shares: 42,
      isLiked: false,
    ),
    PostModel(
      user: users[0],
      caption:
      'More placeholder text for the soul: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      timeAgo: '1d',
      imageUrl: [],
      likes: 482,
      comments: 37,
      shares: 9,
      isLiked: false,
    ),
  ];
  void loadPosts() async{

    //from data file in constants , make sure to clear it before any fetch , to not to repeat the data
    posts = [];

    //adding data to posts in the data.dart
    await Future.delayed(Duration(milliseconds: 500),(){
      for(int i = 0 ; i < fetchedData.length ; i++){
        posts.add(fetchedData.elementAt(i));
      }
    });
      emit(FeedLoadPosts());

      //delay 2 seconds before fetch any posts to application.
    await Future.delayed(Duration(milliseconds: 2000),(){
      emit(FeedLoadedSuccessfully());
    });
  }

  void changeLikeOnPost({
  required PostModel postModel,
}){
    postModel.isLiked = !postModel.isLiked;
    emit(ChangeLikeOnPostState());
  }
}
