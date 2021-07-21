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