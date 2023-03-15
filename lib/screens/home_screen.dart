// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app_fb/components/navigationMenu/drawer_menu.dart';
import 'package:food_order_app_fb/providers/ProductProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getProductCategory();
    super.initState();
  }

  getProductCategory() async {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    if (mounted) {
      productProvider.fetchProductCategories();
      productProvider.fetchProducts();
    } else {
      await Future.delayed(const Duration(milliseconds: 1000));
      getProductCategory();
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      drawer: const DrawerMenu(),
      appBar: AppBar(
        elevation: 0.0,
        // leading: const Icon(Icons.sort),
        // by using custom icon and call darwer
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: const Icon(
              Icons.sort,
              // color: Colors.red,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),

        actions: [
          Container(
            width: 60,
            padding: const EdgeInsets.all(6),
            child: const CircleAvatar(
              // backgroundColor: Colors.red,
              backgroundImage: AssetImage(
                'assets/images/profile.jpg',
              ),
            ),
          )
        ],
        title: const Text('Home'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                hintText: "Search Food",
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color(0xff3a3e3e),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              dragStartBehavior: DragStartBehavior.start,
              child: Row(
                children: productProvider.getProductCategoryList.map((cData) {
                  return CategoryContainer(
                    categoryImage: cData.image.toString(),
                    categoryName: cData.name.toString(),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 510,
              // margin: const EdgeInsets.only(
              //   left: 8,
              //   right: 8,
              // ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: productProvider.getProductList.map((pData) {
                  return BottomFoodContainer(
                    foodImage: pData.image.toString(),
                    foodName: pData.name.toString(),
                    foodPrice: pData.price,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BottomFoodContainer({
    required String foodImage,
    required String foodName,
    required int foodPrice,
  }) {
    return Container(
      height: 270,
      width: 220,
      decoration: BoxDecoration(
        color: const Color(0xff3a3e3e),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            // backgroundImage: AssetImage(foodImage),
            backgroundImage: NetworkImage(foodImage),
          ),
          ListTile(
            leading: Text(
              foodName,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            trailing: Text(
              '\$ $foodPrice',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: const [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget CategoryContainer({
    required String categoryImage,
    required String categoryName,
  }) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage(categoryImage),
              image: NetworkImage(categoryImage),
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          categoryName,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
