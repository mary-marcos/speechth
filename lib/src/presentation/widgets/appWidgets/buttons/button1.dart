import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';

class AppButton1 extends StatelessWidget {
  final double? width, height;
  final String? title;
  final GestureTapCallback? onTap;

  const AppButton1(
      {super.key, this.width, this.height, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w ?? 230.w,
        height: height?.h ?? 55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.orange1, borderRadius: BorderRadius.circular(18)),
        child: Text(
          title ?? '',
          style: AppTextStyle.cairoSemiBold17white,
        ),
      ),
    );
  }
}
