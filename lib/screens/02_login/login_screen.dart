import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/db_helper/db_helper.dart';
import '../../core/utils/all_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: Column(
          children: [
            Container(
              height: 350.h,
              width: 382.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppImages.cap,
                      height: 162.h,
                      width: 150.w,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TabBar(
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      indicatorColor: AppColors.orangeMain,
                      dividerHeight: 2,
                      indicatorWeight: 3,
                      tabs: [
                        Tab(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            // SliverLayoutWidgetBuilder(context, Constraints),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SignInView(),
                  SignUpView(),
                ],
              ),
            )
          ],
        ));
  }
}

class SignInView extends StatelessWidget {
  SignInView({super.key});
  final emailController = TextEditingController();
  final pswController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text(
                  'Email Address',
                ),
                hintText: 'Ahmadxdev@gmail.com',
                enabled: true,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              controller: pswController,
              decoration: const InputDecoration(
                hintText: '* * * * * * * * * *',
                label: Text(
                  'Password',
                ),
                enabled: true,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget Passcode?',
                  style: TextStyle(
                    color: AppColors.orangeMain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () async => await DBHelper().logIn(
                context,
                email: emailController.text,
                password: pswController.text,
              ),
              child: Container(
                // margin: EdgeInsets.only(left: 30.w, bottom: 36.h, right: 30.w),
                height: 60.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: AppColors.orangeMain,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final nameCotroller = TextEditingController();
  final emailCotroller = TextEditingController();
  final pswCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameCotroller,
              decoration: const InputDecoration(
                label: Text(
                  'Name',
                ),
                enabled: true,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: emailCotroller,
              decoration: const InputDecoration(
                label: Text(
                  'Email Address',
                ),
                hintText: 'Ahmadxdev@gmail.com',
                enabled: true,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: pswCotroller,
              decoration: const InputDecoration(
                label: Text(
                  'Password',
                ),
                hintText: '* * * * * * * * * *',
                enabled: true,
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            InkWell(
              onTap: () async {
                await DBHelper().registerUser(
                  context,
                  name: nameCotroller.text,
                  email: emailCotroller.text,
                  password: pswCotroller.text,
                );
              },
              child: Container(
                // margin: EdgeInsets.only(left: 30.w, bottom: 36.h, right: 30.w),
                height: 60.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: AppColors.orangeMain,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
