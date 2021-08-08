class ChangeFavouriteModel{
  bool? status;
  String? message;

  ChangeFavouriteModel.fromJson(Map<String,dynamic> json){
    this.status = json['status'];
    this.message = json['message'];
  }
}