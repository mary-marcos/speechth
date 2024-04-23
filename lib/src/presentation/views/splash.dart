import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/utils/strings/routes_names.dart';
import 'package:speechth/src/utils/variables/vars.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading();
  }

  _loading() {
    Timer(const Duration(seconds: 3), () {
      if (Vars.user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.loginScreen, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.homeScreen, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesLogo,
              width: 120.w,
            ),
            const AppSizedBox(height: 20),
            Text(
              "Your Speech Therapy",
              style: AppTextStyle.cairoBold20white,
            )
          ],
        ),
      ),
    );
  }
}
