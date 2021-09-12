import 'package:facbook_app/models/user_model/user_model.dart';

class PostModel{
  UserModel user;
  String caption;
  String timeAgo;
  List<String> imageUrl;
  int likes;
  int comments;
  int shares;

  PostModel({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}