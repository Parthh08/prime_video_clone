import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prime_video_clone/constants/colors.dart';
import 'package:prime_video_clone/screens/otp_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/prime_logo_white.png',
          height: 50,
          width: 70,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    'Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ' Sign in Already a customer?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Email or phone number',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50.h,
                    width: 0.9.sw,
                    child: const TextField(
                      cursorColor: Color(0xFF00A8E1),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Color(0xFF00A8E1),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Add some spacing between widgets
                  Container(
                    height: 50.h,
                    width: 0.9.sw,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => OTPscreen()),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF3c648c)),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'By signing in, you agree to the ',
                      style: TextStyle(color: Color(0xFF7b909c), height: 1.3),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Prime Video Terms of Use',
                          style: TextStyle(color: Color(0xFF00A8E1)),
                        ),
                        TextSpan(
                            text:
                                ' and license agreements which can be found on Amazon website.',
                            style: TextStyle(color: Color(0xFF7b909c)))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RichText(
                    text: const TextSpan(
                      text:
                          'Prime membership is required to watch Prime-eligible titles.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          height: 1.3),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_right_outlined,
                        color: Colors.grey.shade800,
                        size: 20,
                      ),
                      const DropdownButtonHideUnderline(
                        child:
                        Text(
                          'Need help?',
                          style: TextStyle(color: Color(0xFF00A8E1)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40,),
            Text('© 1996-2024, Amazon.com, Inc.or its affiliates',style: TextStyle(color: Color(0xFF7b909c)),),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
