import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';

class AuthBackButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  const AuthBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "السابق",
            style: AppTextStyle.cairoSemiBold15blue,
          ),
          Icon(
            Icons.arrow_forward,
            color: AppColors.black,
            size: 18.r,
          )
        ],
      ),
    );
  }
}
