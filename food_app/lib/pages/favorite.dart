import 'package:flutter/material.dart';
import 'package:food_app/pages/components/item_wrapper.dart';
import 'package:food_app/pages/home.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int selectedIndex = 0; // 0: Video, 1: Công thức

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFB58C00)),
          onPressed: () {},
        ),
        title: Text(
          'Công thức',
          style: TextStyle(
            color: Color.fromARGB(255, 164, 120, 4),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 18),
              Expanded(child: buildTabButton(0, 'Video')),
              SizedBox(width: 12),
              Expanded(child: buildTabButton(1, 'Công thức')),
              SizedBox(width: 18),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: selectedIndex == 0
                  ? FavoriteList()
                  : Text(
                      '\Công thức',
                      style: TextStyle(fontSize: 16),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabButton(int index, String text) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 206, 167, 0)
              : Color.fromARGB(38, 206, 167, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color:
                  isSelected ? Colors.white : Color.fromARGB(255, 206, 167, 0),
              fontWeight: FontWeight.w400,
              fontSize: 15),
        ),
      ),
    );
  }
}

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Obx(() {
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: homeController.itemList.length,
            itemBuilder: (context, index) {
              var item = homeController.itemList[index];
              return ItemWrapper(thumbUrl: item.thumb, id: item.id);
            },
          );
        }));
  }
}
