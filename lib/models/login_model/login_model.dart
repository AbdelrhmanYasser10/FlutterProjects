class LoginModel{

  String? message;
  bool? status;
  UserData? userData;

  LoginModel({
   this.message,
   this.userData,
   this.status,
});

  LoginModel.fromJson(Map<String,dynamic> json){
    this.message = json['message'];
    this.status = json['status'];
    this.userData = json['data']!=null? UserData.fromJson(json['data']):null;
  }
}

class UserData{
  int?id;
  String? name;
  String? email;
  String?phone;
  String?image;
  int? points;
  int? credit;
  String?token;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
});

  ///Named Constructor
  UserData.fromJson(Map <String,dynamic> json){
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.image = json['image'];
    this.points = json['points'];
    this.credit = json['credit'];
    this.token = json['token'];
  }
}