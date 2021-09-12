import 'package:facbook_app/models/user_model/user_model.dart';

class StoryModel{
  UserModel?user;
  String? imageUrl;
  bool isView = false;
  StoryModel({
    required this.user,
    required this.imageUrl,
    required this.isView,
  });

}