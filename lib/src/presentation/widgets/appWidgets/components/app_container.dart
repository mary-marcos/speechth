import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final double? width, height;

  const AppContainer({super.key, this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      height: height?.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(25)),
      child: child,
    );
  }
}
