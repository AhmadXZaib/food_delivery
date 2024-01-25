// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/db_helper/db_helper.dart';
import 'package:food_delivery/screens/02_login/login_screen.dart';
import 'package:food_delivery/screens/03_home_screen/home_screen.dart';
import '../../core/utils/all_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// ignore: camel_case_types
class _SplashScreenState extends State<SplashScreen> {
  bool img = false;
  bool txt = false;
  bool img2 = false;
  bool btn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 300), () {
      setState(() {
        img = true;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        txt = true;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        img2 = true;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        btn = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeMain,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1500),
              top: img ? 18.h : -100.h,
              left: 53.w,
              child: CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.white,
                  child: Center(
                    child: Image.asset(
                      AppImages.cap,
                    ),
                  )),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: 100.h,
              left: txt ? 50.w : -290.w,
              child: Text(
                'Food for \nEveryOne',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 62.sp,
                  height: 0.h,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 4),
              left: img2 ? 165.w : 500.w,
              top: 310.h,
              child: Image.asset(
                AppImages.splash1,
                height: 278.h,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 4),
              right: img2 ? 110.w : 700.w,
              top: 250.h,
              child: Image.asset(
                AppImages.splash2,
                height: 350.h,
                // width: 366.w,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColors.splash, AppColors.splash.withOpacity(0.1)],
                )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.splash,
                    AppColors.splash.withOpacity(0.01)
                  ],
                )),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 6),
              left: 7.w,
              top: btn ? 580.h : 700.h,
              child: InkWell(
                onTap: () async {
                  bool check = await DBHelper().checkUserLoggedIn();

                  if (check) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 30.w, bottom: 36.h, right: 30.w),
                  height: 60.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      'Get Start',
                      style: TextStyle(color: AppColors.orangeMain),
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
