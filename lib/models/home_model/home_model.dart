class HomeModel{

  bool?status;
  HomeData? data;

  HomeModel.fromJson(Map<String,dynamic> json){
    this.status = json['status'];
    this.data = HomeData.fromJson(json['data']);
  }

}

class HomeData{
  List<BannerModel>? banners = [];
  List<dynamic>? products = [];
  HomeData.fromJson(Map<String,dynamic>json){
    json['banners'].forEach((element){
      banners!.add(element);
    });

    json['products'].forEach((element){
      products!.add(element);
    });
  }
}

class BannerModel{
  int?id;
  String?image;
  BannerModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel{
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? favourite;
  bool? inCart;
  ProductModel.fromJson(Map<String,dynamic>json){
    this.id = json['id'];
    this.price = json['price'];
    this.oldPrice = json['old_price'];
    this.discount = json['discount'];
    this.image = json['image'];
    this.name = json['name'];
    this.favourite = json['in_favourite'];
    this.inCart = json['in_cart'];
  }
}