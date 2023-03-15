import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app_fb/models/product_category_model.dart';
import 'package:food_order_app_fb/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductCategoryModel> productCategoryList = [];
  late ProductCategoryModel productCategoryModel;
  List<ProductModel> productList = [];
  late ProductModel productModel;

  ////////////Get Product Categories List//////////

  Future<void> fetchProductCategories() async {
    List<ProductCategoryModel> newProductCategoryList = [];

    // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //     .collection('foodCategories')
    //     .doc('JpfPm8TAfNtixMsCGCs0')
    //     .collection('burger')
    //     .get();
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('foodCategories').get();

    // querySnapshot.docs.forEach((element) {
    //   productCategoryModel = ProductCategoryModel(
    //     image: element.get('image'),
    //     name: element.get('name'),
    //     categoryId: element.get('categoryId'),
    //   );
    //   newProductCategoryList.add(productCategoryModel);
    // });
    for (var element in querySnapshot.docs) {
      productCategoryModel = ProductCategoryModel(
        image: element.get('image'),
        name: element.get('name'),
        categoryId: element.get('categoryId'),
      );
      // print('@@Fetch.ProductCategoryList--> $productCategoryModel');
      newProductCategoryList.add(productCategoryModel);
    }

    productCategoryList = newProductCategoryList;
    notifyListeners();
  }

  List<ProductCategoryModel> get getProductCategoryList {
    return productCategoryList;
  }

  ////////////Get Product Categories List End//////////

  ////////////Get Product List//////////

  Future<void> fetchProducts() async {
    List<ProductModel> newProductList = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('foods').get();

    for (var element in querySnapshot.docs) {
      productModel = ProductModel(
        image: element.get('image'),
        name: element.get('name'),
        price: element.get('price'),
        productId: element.get('productId'),
      );
      print('@@Fetch.ProductList--> $productModel');

      newProductList.add(productModel);
    }

    productList = newProductList;
    notifyListeners();
  }

  List<ProductModel> get getProductList {
    return productList;
  }

  ////////////Get Product List End//////////

}
