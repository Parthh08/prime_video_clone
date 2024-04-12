import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prime_video_clone/constants/colors.dart';
import 'package:prime_video_clone/screens/login_signup_screen.dart';

class OTPscreen extends StatelessWidget {
  const OTPscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
            child: Text(
              'Back',//FIX THIS
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
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Authentication required',
                style: TextStyle(
                    color: Colors.white,

                    fontWeight: FontWeight.w600),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'IN +917000356242 ',
                  style: TextStyle(color: Color(0xFF7b909c), height: 1.3),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Change',
                      style: TextStyle(color: Color(0xFF00A8E1),

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
