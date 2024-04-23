import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/generated/assets.dart';

class UserPicture extends StatelessWidget {
  final double size;
  const UserPicture({super.key,this.size=75});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      Assets.imagesProfile,
      height: size.h,
      width: size.w,
    );
  }
}
