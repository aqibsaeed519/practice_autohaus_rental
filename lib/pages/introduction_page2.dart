
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitledapp/pages/signup_page.dart';
import 'package:untitledapp/utilis/constants.dart';

import '../model/intoduction_model.dart';
import 'login_page.dart';


class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  //late AnimationController animationController;
  int currentIndex = 0;
  PageController? pageController;

  List<IntroductionModel> screens = <IntroductionModel>[
    IntroductionModel(
      img: 'assets/images/image1.svg',
      text: "Greater Accessibility",
      desc:
      "Eliminating the barriers to EV \nownership through simplified \ncomprehensive solutions.",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    IntroductionModel(
    img: 'assets/images/image3.svg',
  text: "Greater Accessibility",
  desc:
  "Eliminating the barriers to EV \nownership through simplified \ncomprehensive solutions.",
      bg: const Color(0xFF4756DF),
      button: Colors.white,
    ),
    IntroductionModel(
      img: 'assets/images/license.svg',
      text: "Greater Accessibility",
      desc:
      "Eliminating the barriers to EV \nownership through simplified \ncomprehensive solutions.",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
  ];
  

// calling init state when the app start
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }
// dispose the widget 
  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }
// // method for going to next page
//   void nextPage() {
//     if (currentIndex < screens.length - 1) {
//       pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     }
//   }

//   //skip method
//   void skipToLogin() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const LoginPage(),
//       ),
//     );
//   }

// building widget
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            //creating page view builder container// 
            PageView.builder(
              itemCount: screens.length,
              controller:  pageController,
              physics: const AlwaysScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Container(
                      height: 130,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Text(
                            screens[index].text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            screens[index].desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white60,
                              fontFamily: 'PoppinsRegular'
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    SvgPicture.asset(
                      screens[index].img,
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                );
              },
            ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: Column(
              children: [
                // Page Indicators
                Container(
                  height: 10.0,
                  color: Colors.transparent,
                  child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            width: currentIndex == index ? 20 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? Colors.brown
                                  : Colors.brown,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (currentIndex == screens.length - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        }
                        pageController!.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
          
         