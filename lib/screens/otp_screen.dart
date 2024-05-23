import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prime_video_clone/constants/colors.dart';
import 'package:prime_video_clone/screens/homeScreen.dart';
import 'package:prime_video_clone/screens/login_signup_screen.dart';

class OTPscreen extends StatefulWidget {
  String verificationid;

  OTPscreen({super.key, required this.verificationid});

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: const Text(
            'Back',
            style: TextStyle(
                color: Color(0xFF00A8E1),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      'Authentication required',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: const TextSpan(
                      text: 'IN +917000356242 ',
                      style: TextStyle(color: Color(0xFF7b909c), height: 1.3),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Change',
                          style: TextStyle(
                            color: Color(0xFF00A8E1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                      child: Text(
                    "We've sent a One Time Password (OTP) to the mobile number above. Please enter it to complete the verification",
                    style: TextStyle(color: Color(0xFF7b909c)),
                  )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
              width: 0.9.sw,
              child: TextField(
                controller: otpController,
                cursorColor: const Color(0xFF00A8E1),
                cursorHeight: 20,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  filled: true,
                  focusColor: Color(0xFF00A8E1),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Add some spacing between widgets
            SizedBox(
              height: 50.h,
              width: 0.9.sw,
              child: TextButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: otpController.text.toString());
                    FirebaseAuth.instance.signInWithCredential(credential).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WhosWatching()));
                    });
                  } catch (ex) {
                    log(ex.toString() as num);
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF3c648c)),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Resend OTP',
                style: TextStyle(
                    color: Color(0xFF00A8E1), fontWeight: FontWeight.w700),
              ),
            ),
            //SizedBox(height:5,),
            const Text(
              'or',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50.h,
              width: 0.9.sw,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WhosWatching()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF7b909c)),
                ),
                child: const Text(
                  'Sign in with your password',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              '© 1996-2024, Amazon.com, Inc.or its affiliates',
              style: TextStyle(color: Color(0xFF7b909c)),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
