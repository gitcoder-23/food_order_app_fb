class ProductModel {
  String image;
  String name;
  int price;
  int productId;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.productId,
  });

  // ProductModel.fromJson(Map<String, dynamic> json) {
  //   image = json['image'];
  //   name = json['name'];
  //   price = json['price'];
  //   productId = json['productId'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['image'] = image;
  //   data['name'] = name;
  //   data['price'] = price;
  //   data['productId'] = productId;
  //   return data;
  // }
}
