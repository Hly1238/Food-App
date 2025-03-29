import 'package:flutter/material.dart';
import 'package:food_app/pages/home.dart';
import 'package:food_app/pages/navigation.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleClick() {
      Get.to(Navigation());
    }

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/onboarding.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.9),
              ],
              stops: [0.7, 1.0],
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Bắt đầu với những món ăn',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 37,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () => handleClick(),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 126,
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFCEA700),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bắt đầu',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_outward_sharp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
