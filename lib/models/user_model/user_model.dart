class UserModel{

  bool?status;
  UserData?data;
  UserModel.fromJson(Map<String,dynamic> json){
    this.status = json['status'];
    this.data = UserData.fromJson(json['data']);
  }
}

class UserData{
  int? id;
  String? name;
  String?email;
  String? phone;
  String?image;
  int?points;
  int?credits;
  String?token;

  UserData.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.name =json['name'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.image = json['image'];
    this.credits = json['credit'];
    this.points = json['points'];
    this.token = json['token'];
  }
}