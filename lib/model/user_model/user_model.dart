class User {
  late String email;
  late String uid;
  late String photoUrl;
  late String bio;
  late List followers;
  late List following;
  late String username;

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    bio = json['bio'];
    following = json['following'];
    followers = json['followers'];
    username = json['username'];
  }

  User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.bio,
    required this.followers,
    required this.following,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'uid': uid,
      'photoUrl': photoUrl,
      'bio': bio,
      'followers': followers,
      'following': following,
    };
  }
}
