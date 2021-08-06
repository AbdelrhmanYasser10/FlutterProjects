class Character{
  int? charId;
  String? name;
  String? nickName;
  String? image;
  String? status;
  String? portrayed;
  String? category;
  List<dynamic>? occupation; //jobs
  List<dynamic>? appearance; //appearance in seasons
  List<dynamic>?betterCallSaulAppearance; //appearance in other series

  Character.fromJson(Map<String,dynamic> json){
    charId = json['char_id'];
    name = json['name'];
    nickName = json['nickname'];
    image = json['img'];
    status = json['status'];
    portrayed = json['portrayed'];
    category = json['category'];
    occupation = json['occupation'];
    appearance = json['appearance'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}