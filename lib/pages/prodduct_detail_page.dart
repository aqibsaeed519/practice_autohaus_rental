import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitledapp/pages/home_page.dart';
import 'package:untitledapp/utilis/component/check_contaainer.dart';
import 'package:untitledapp/utilis/component/description_product_detaill.dart';
import 'package:untitledapp/utilis/constants.dart';
import 'package:animate_do/animate_do.dart';



class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with SingleTickerProviderStateMixin {
      String dropdownvalue = 'Tesla';
 late TabController _tabController;

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
        return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 354,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Column(children: [
             const SizedBox(
              height: 50.0,
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: const Icon(  Icons.arrow_back_ios,) ,
                    color: Colors.white,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  FadeIn(
                    child: const Text(
                      'Tesla S Series 2022',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF5F5F5),
                        fontSize: 20,
                        fontFamily: 'PoppinsRegular',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  FadeIn(
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Container(
                  width: 359.93,
                  height: 225.22,
                  decoration: const BoxDecoration(),
                  child:  Stack(
                    children: [
                      Positioned(
                          top: 8,
                          left: 08,
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: FadeIn(child: SvgPicture.asset("assets/images/frame.svg")),
                          )
                          ),
                       const Positioned(
                        top: 8,
                        right: 8,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Icon(Icons.favorite_outline_outlined,
                          
                          color: Colors.white,),
                        ), // Replace with your top right icon image
                      ),
                       Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SizedBox(
                            height: 19,
                            width: 107,
                            child: Column(
                              children: [
                                FadeIn(
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                      Text(
                                        '4 Stars',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12, fontFamily: 'PoppinsRegular'),
                                      ),
                                    ],
                                  ),
                                ), // Replace with your rating stars image
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                           top: 30.0, // Adjust as needed
                          left: 80.0,
                          right: 80.0, // Adjust as needed
                          child: FadeInUp(
                            child: Container(
                              decoration: const BoxDecoration(),
                              height: 152,
                              width: 307,
                              child: Hero(
                                tag: context,
                                child: Image.asset('assets/images/icar.png')),
                              // SvgPicture.asset(
                              //     'assets/images/logo.svg'), // Replace with your center image,
                            ),
                          )),
                      Positioned(
                          bottom: 40.0,
                          left: 50.0,
                          right: 50.0,
                          child: SvgPicture.asset('assets/images/ellipse1.svg'))
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const SizedBox(
               height: 10,         
            ),
            FadeInLeft(
              delay: const Duration(seconds: 1),
            child: const CheckCOntainer()),
          const SizedBox(
              height: 10,
            ),
      
              FadeIn(
                delay: const Duration(seconds: 1),
                child: Container(  
                    width: 342,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TabBar(
                      padding: const EdgeInsets.all(5),
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'PoppinsRegular',
                          fontWeight: FontWeight.w500),
                      indicatorColor: Colors.white10,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      tabs: const [
                        SizedBox(
                          width: 120,
                          height: 38,
                          child: Tab(
                            text: 'Description',
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          height: 38,
                          child: Tab(
                            text: 'Features',
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          height: 38,
                          child: Tab(
                            text: 'Rating',
                          ),
                        )
                      ],
                    ),
                  ),
              ),
                 Expanded(
                  child: FadeInDownBig(
                    child: const TabBarView(
                      children: [
                        DescriptionProductDetail(),
                        Center(child: Text('Feature ')),
                        Center(child: Text("Rating")),
                      ],
                    ),
                  ),
                ),
            
           FadeInDown(
            delay: const Duration(seconds: 1),
             child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
              },
               child: Container(
                  width: 283,
                  height: 48,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFA87B5D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                   textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF5F5F5),
                      fontSize: 18,
                      fontFamily: 'PoppinsRegular',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
