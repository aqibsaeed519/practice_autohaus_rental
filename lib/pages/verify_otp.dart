import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitledapp/pages/home_page.dart';
import 'package:untitledapp/pages/set_password.dart';
import 'package:untitledapp/utilis/constants.dart';
import 'package:untitledapp/utilis/widgets/custom_input_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  //initializing variable data
  final TextEditingController _emailController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  SizedBox(height: size.height * 0.1),
                  const Text(
                    'Verify OTP',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'PoppinsRegular',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 0),
                  ),
                  SizedBox(height: size.height * 0.1),
                  SvgPicture.asset("assets/images/logo.svg"),
                  SizedBox(height: size.height * 0.09),
                  const Text(
                    'We sent you a code with a 6 digit code.Enter\nthe code to verify your email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                     pastedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      // borderRadius: BorderRadius.circular(20),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      // activeFillColor: Colors.white,
                      activeColor: Colors.brown,
                      selectedColor: Colors.white
                    ),
                    
                  
                
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.04,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SetPassword()));
                    },
                    child: Container(
                      width: 283,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Center(
                        child: Text(
                          "Next ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PoppinsRegular',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/timer.svg',
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          const Text(
                            "Expire on 02:00",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFFF6666),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Resend code ',
                                style: TextStyle(
                                  color: Color(0xFFA87B5D),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '(4)',
                                style: TextStyle(
                                  color: Color(0xFFA87B5D),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container roundContainer() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.white, width: 1)),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: '0',
            prefixText: '   ',
            // contentPadding: EdgeInsets.symmetric(horizontal: 14),
            hintStyle: TextStyle(
              color: AppColors.greyWhite,
            )),
      ),
    );
  }
}
