class ProductCategoryModel {
  String? image;
  String? name;
  int? categoryId;

  ProductCategoryModel({
    this.image,
    this.name,
    this.categoryId,
  });

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['categoryId'] = categoryId;
    return data;
  }
}
