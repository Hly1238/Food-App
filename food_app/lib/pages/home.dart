import 'package:flutter/material.dart';
import 'package:food_app/controller/home_controller.dart';
import 'package:food_app/pages/components/item_wrapper.dart';
import 'package:food_app/pages/search.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color(0xFF3C3C4399),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Tìm kiếm sản phẩm',
                    style: GoogleFonts.inter(
                      color: Color(0xFF3C3C4399),
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! [1st]
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TP. Hồ Chí Minh',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Xem tất cả',
                      style: TextStyle(color: Color(0xFFCEA700), fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () {
                    return Container(
                      height: 235,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: homeController.itemList.length,
                        itemBuilder: (context, index) {
                          final item = homeController.itemList[index];
                          return ItemWrapper(
                            thumbUrl: item.thumb,
                            id: item.id,
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                // ! [2nd]
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Danh mục',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Xem tất cả',
                      style: TextStyle(color: Color(0xFFCEA700), fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Column(
                    children: [
                      Container(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: homeController.categoryList.length,
                          itemBuilder: (context, index) {
                            return CategoryButton(
                              name: homeController.categoryList[index],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 215,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: homeController.mealByCate.length,
                          itemBuilder: (context, index) {
                            final item = homeController.mealByCate[index];
                            return CategoryWrapper(
                              name: item.name,
                              id: item.id,
                              thumbUrl: item.thumb,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                // ![3rd]
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Công thức gần đây',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () {
                    return Container(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: homeController.mealByIngredient.length,
                        itemBuilder: (context, index) {
                          final item = homeController.mealByIngredient[index];
                          return RecipeWrapper(
                            id: item.id,
                            name: item.name,
                            thumbUrl: item.thumb,
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),

                // ! [4th]
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nguyên liệu',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Wrap(
                    spacing: 27,
                    runSpacing: 10,
                    children: homeController.ingredientList
                        .take(5)
                        .map((category) => CategoryButton(name: category))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeWrapper extends StatelessWidget {
  final String thumbUrl;
  final String id;
  final String name;
  const RecipeWrapper({
    super.key,
    required this.thumbUrl,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133,
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            child: Image(
              image: NetworkImage('${thumbUrl}'),
              fit: BoxFit.cover,
              height: 133,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 115, 76, 16),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFF8F8F8),
                radius: 9,
                backgroundImage: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/a310/7167/a93c61344decd7af1a44bd5b4a7b1cdc?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=DFHwYY6Z11renEmsAxqXoKrrhWR9XeVzIAn-9BubBmK72xgtN1Bgs0uKRDP7d~8pb0jnhhzweguOqKS~ESnb5qQvAwsJp6zS0oxwYfc6KtvhqF8CjHxJw9ZRXApN477HlUW0b6smFFaomIzvC~Wd5DdfVLmitk5HEIB5wG0exnupt8WhxHH71sEZsl~h203jaaWC89qC7oDRPOlqg1uMA4exun-8Zs13gabO5usJMkmie9ytdZjmnSFcP8kP4NQD9eq0ll0AZ7gzAueUq3wDwBPj8Ui~y-g9OQKkIgFOzznc94nbr4FKSc8QHC2zyvzXjqtkiYx1q1DJ5ww1BjIkJg__'),
              ),
              SizedBox(width: 8),
              Text(
                'Nguyễn Đình Trọng',
                style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 0, 45, 115)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// todo [CategoryWrapper]
class CategoryWrapper extends StatelessWidget {
  final String thumbUrl;
  final String id;
  final String name;

  const CategoryWrapper({
    super.key,
    required this.thumbUrl,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 180,
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: Color.fromARGB(38, 206, 168, 0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 170, 83, 16),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Tạo bởi\nTrần Đình Trọng',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 67, 40, 5),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '20 phút',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 67, 40, 5),
                      ),
                    ),
                    Icon(
                      Icons.menu_book_outlined,
                      size: 20,
                      color: Color.fromARGB(255, 115, 76, 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: CircleAvatar(
              backgroundColor: Color(0xFFF8F8F8),
              radius: 35,
              backgroundImage: NetworkImage(thumbUrl),
            ),
          ),
        ],
      ),
    );
  }
}

// todo [Category Button]
class CategoryButton extends StatefulWidget {
  final String name;
  const CategoryButton({super.key, required this.name});
  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool isTapped = false; // Trạng thái khi nhấn

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100),
                child: Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isTapped ? Color(0xFFCEA700) : Colors.transparent,
                    border: Border.all(
                      color: isTapped ? Colors.white : Color(0xFF615358),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: isTapped ? Colors.white : Color(0xFF615358),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 7,
              )
            ],
          )),
    );
  }
}
