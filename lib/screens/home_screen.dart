// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const Icon(Icons.sort),
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
            // InkWell(
            //   onTap: () async {
            //     await FirebaseAuth.instance.signOut();
            //   },
            //   child:  Text('Logout'),
            // ),
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
                children: [
                  CategoryContainer(
                    categoryImage: 'assets/images/1.png',
                    categoryName: 'All',
                  ),
                  CategoryContainer(
                    categoryImage: 'assets/images/2.png',
                    categoryName: 'Burger',
                  ),
                  CategoryContainer(
                    categoryImage: 'assets/images/3.png',
                    categoryName: 'Recipe',
                  ),
                  CategoryContainer(
                    categoryImage: 'assets/images/4.png',
                    categoryName: 'Pizza',
                  ),
                  CategoryContainer(
                    categoryImage: 'assets/images/5.png',
                    categoryName: 'Drink',
                  ),
                ],
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
                children: [
                  BottomFoodContainer(
                    foodImage: 'assets/images/3.png',
                    foodName: 'Burger',
                    foodPrice: '123',
                  ),
                  BottomFoodContainer(
                    foodImage: 'assets/images/3.png',
                    foodName: 'Burger',
                    foodPrice: '123',
                  ),
                  BottomFoodContainer(
                    foodImage: 'assets/images/3.png',
                    foodName: 'Burger',
                    foodPrice: '123',
                  ),
                  BottomFoodContainer(
                    foodImage: 'assets/images/3.png',
                    foodName: 'Burger',
                    foodPrice: '123',
                  ),
                  BottomFoodContainer(
                    foodImage: 'assets/images/3.png',
                    foodName: 'Burger',
                    foodPrice: '123',
                  ),
                  BottomFoodContainer(
                    foodImage: 'assets/images/3.png',
                    foodName: 'Burger',
                    foodPrice: '123',
                  ),
                ],
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
    required String foodPrice,
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
            backgroundImage: AssetImage(foodImage),
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
              image: AssetImage(categoryImage),
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
