//

// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/utils/strings/fonts.dart';

class Toasters {
  static const double defaultRadius = 4;
  static const EdgeInsets defaultTextPadding = EdgeInsets.all(10);
  static const Miui10AnimBuilder defaultAnimationBuilder = Miui10AnimBuilder();

  // Success Toaster
  static show(String message, {bool isError = true, int duration = 1250}) {
    return showToast(
      message,
      position: ToastPosition.bottom,
      backgroundColor: isError ? Colors.red : Colors.green,
      radius: defaultRadius.r,
      textStyle: const TextStyle(fontSize: 14, color: AppColors.white,fontFamily: Fonts.cairo),
      animationBuilder: defaultAnimationBuilder,
      textPadding: defaultTextPadding,
      duration: const Duration(milliseconds: 1250),
    );
  }
}

class Miui10AnimBuilder extends BaseAnimationBuilder {
  @Deprecated('Please build animation builders outside the package.')
  const Miui10AnimBuilder();

  @Deprecated('Please build animation builders outside the package.')
  @override
  Widget buildWidget(
    BuildContext context,
    Widget child,
    AnimationController controller,
    double percent,
  ) {
    final double opacity = min(1.0, percent + 0.2);
    final double offset = (1 - percent) * 20;

    return Opacity(
      opacity: opacity,
      child: Transform.translate(offset: Offset(0, offset), child: child),
    );
  }
}
