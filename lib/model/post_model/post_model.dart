class Post {
  late String description;
  late String uid;
  late String username;
  late dynamic likes;
  late String postId;
  late DateTime datePublished;
  late String postUrl;
  late String profImage;

  Post(
      {required this.description,
        required this.uid,
        required this.username,
        required this.likes,
        required this.postId,
        required this.datePublished,
        required this.postUrl,
        required this.profImage,
      });

   Post.fromJson(Map<String , dynamic> json) {
        description = json["description"];
        uid =  json["uid"];
        likes =  json["likes"];
        postId = json["postId"];
        datePublished =  json["datePublished"];
        username =  json["username"];
        postUrl =  json['postUrl'];
        profImage = json['profImage'];

  }

  Map<String, dynamic> toMap() => {
    "description": description,
    "uid": uid,
    "likes": likes,
    "username": username,
    "postId": postId,
    "datePublished": datePublished,
    'postUrl': postUrl,
    'profImage': profImage
  };
}