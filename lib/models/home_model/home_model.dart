class HomeModel{

  bool?status;
  HomeData? data;

  HomeModel.fromJson(Map<String,dynamic> json){
    this.status = json['status'];
    this.data = HomeData.fromJson(json['data']);
  }

}

class HomeData{
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  HomeData.fromJson(Map<String,dynamic>json){
    json['banners'].forEach((element)
    {
      banners.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element)
    {
      products.add(ProductModel.fromJson(element));
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
  late dynamic image;
  late dynamic name;
  late dynamic favourite;
  late dynamic inCart;
  ProductModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    favourite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}