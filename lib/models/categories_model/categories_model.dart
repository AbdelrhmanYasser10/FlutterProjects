class CategoriesModel{

  bool? status;
  CategoriesSecondaryData? data;

  CategoriesModel.fromJson(Map<String,dynamic> json){
    this.status = json['status'];
    this.data = CategoriesSecondaryData.fromJson(json['data']);
  }
}

class CategoriesSecondaryData{
  int?currentPage;
  List<CategoriesData> data = [];

  CategoriesSecondaryData.fromJson(Map<String,dynamic>json){
    this.currentPage = json['current_page'];
    json['data'].forEach((element){
      data.add(CategoriesData.fromJson(element));
    });
  }
}

class CategoriesData{
  int? id;
  String? name;
  CategoriesData.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.name = json['name'];
  }
}