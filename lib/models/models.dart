class SocialUserModel{
   late String name;
   late String email;
   late String phone;
   late String uId;
   late String bio;
   late String cover;
   late String image;
   late bool isEmailVerified;

   SocialUserModel({
   required this.name,
   required this.email,
   required this.uId,
   required this.bio,
   required this.cover,
   required this.image,
   required this.isEmailVerified,
   required this.phone,
});

   SocialUserModel.fromJason(Map<String,dynamic>json){
     email = json['email'];
     phone = json['phone'];
     uId = json['uId'];
     name = json['name'];
     cover = json['cover'];
     image = json['image'];
     bio = json['bio'];
     isEmailVerified = json['isEmailVerified'];
   }
   Map<String,dynamic> toMap(){

     return{
       "name":name,
       "uId":uId,
       "email":email,
       "phone":phone,
       "image":image,
       "cover":cover,
       "bio":bio,
       "isEmailVerified":isEmailVerified,
     };
   }

}

class PostModel
{
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text;
  String? postImage;

  PostModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'uId':uId,
      'image':image,
      'dateTime':dateTime,
      'text':text,
      'postImage':postImage,
    };
  }
}

class CommentModel{
  String? uId;
  String? comment;
  String? dateTime;
  String? postId;


  CommentModel({
    this.uId,
    this.dateTime,
    this.comment,
    this.postId,
  });

  CommentModel.fromJson(Map<String, dynamic> json)
  {
    uId = json['uId'];
    dateTime = json['dateTime'];
    comment = json['Comment'];
    postId = json['postId'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'Comment':comment,
      'uId':uId,
      'dateTime':dateTime,
      'postId':postId,
    };
  }
}

class MessageModel {
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? text;

  MessageModel({
    this.senderId,
    this.receiverId,
    this.dateTime,
    this.text,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
  {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    text = json['text'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'senderId':senderId,
      'receiverId':receiverId,
      'dateTime':dateTime,
      'text':text,
    };
  }
}