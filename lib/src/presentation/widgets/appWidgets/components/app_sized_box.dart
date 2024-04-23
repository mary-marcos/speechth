import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizedBox extends StatelessWidget {
  final double? height, width;
  final Widget? child;

  const AppSizedBox({Key? key, this.height, this.width, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: width?.w,
      child: child,
    );
  }
}
