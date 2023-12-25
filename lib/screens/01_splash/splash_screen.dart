import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/utils/all_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool load = false;
  bool loadBtn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        setState(() {
          load = true;
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 1200),
      () {
        setState(() {
          loadBtn = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splash,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 49.w),
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 36.r,
                  child: Center(
                    child: Image.asset(AppImages.cap),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 49.w),
                child: Text(
                  'Food for Everyone',
                  style: TextStyle(
                    height: 0,
                    fontSize: 65.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
              // Spacer(),
              Container(
                height: 450.h,
                color: AppColors.splash,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 1200),
                      right: -60.w,
                      top: load ? 49.h : 500.h,
                      child: Image.asset(
                        AppImages.splash1,
                        height: 298.h,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      left: -110.w,
                      top: -25.h,
                      child: Image.asset(
                        AppImages.splash2,
                        height: 434.h,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColors.splash,
                            AppColors.splash.withOpacity(0.1)
                          ],
                        )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 200,
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
                      duration: const Duration(milliseconds: 1200),
                      bottom: loadBtn ? 30.h : -300,
                      // left: 51.w,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 30.w, bottom: 36.h, right: 30.w),
                        height: 70.h,
                        width: 314.w,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
