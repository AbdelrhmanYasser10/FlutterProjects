class FavouriteModel{
  bool?status;
  FavouriteData? favouriteData;

  FavouriteModel.fromJson(Map<String,dynamic>json){
    this.status = json['status'];
    this.favouriteData = FavouriteData.fromJson(json['data']);
  }
}

class FavouriteData{
  int? currentPage;
  List< ProductData> products =[];

  FavouriteData.fromJson(Map<String,dynamic> json){
    this.currentPage = json['current_page'];
    json['data'].forEach((elements){
      products.add(ProductData.fromJson(elements));
    });
  }
}

class ProductData{
  int? id;
  FavouriteProductModel? productModel;
  ProductData.fromJson(Map<String,dynamic>json){
    this.id = json['id'];
    this.productModel = FavouriteProductModel.fromJson(json['product']);
  }
}
class FavouriteProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  late dynamic image;
  late dynamic name;

  FavouriteProductModel.fromJson(Map<String, dynamic>json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}
