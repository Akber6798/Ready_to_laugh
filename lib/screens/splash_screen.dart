import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_to_laugh/screens/home_screen.dart';
import 'package:ready_to_laugh/utils/app_colors.dart';
import 'package:ready_to_laugh/utils/app_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image(
                height: 280.h,
                width: 280.w,
                image: const AssetImage("assets/icon/silly.png")),
            Text("Are you ready to laugh?",
                style: AppStyle()
                    .appTextStyle(60, AppColors.textColor, FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Future<void> delay() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      },
    );
  }
}
