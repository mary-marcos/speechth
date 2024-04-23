import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/generated/assets.dart';

class Logo extends StatelessWidget {
  final double size;
  const Logo({Key? key,  this.size=120}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesLogo2,
      width: size.w,
      height: size.h,
    );
  }
}
