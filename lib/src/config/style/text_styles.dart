import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/utils/strings/fonts.dart';

class AppTextStyle {
  ///FontsFamily
  static const TextStyle cairo = TextStyle(fontFamily: Fonts.cairo);

  ///FontsWeight
  static final TextStyle cairoExtraBold =
      cairo.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle cairoBold =
      cairo.copyWith(fontWeight: FontWeight.w600);
  static final TextStyle cairoSemiBold =
      cairo.copyWith(fontWeight: FontWeight.w500);
  static final TextStyle cairoMedium =
      cairo.copyWith(fontWeight: FontWeight.w400);
  static final TextStyle cairoLight =
      cairo.copyWith(fontWeight: FontWeight.w300);
  static final TextStyle cairoExtraLight =
      cairo.copyWith(fontWeight: FontWeight.w200);
  static final TextStyle cairoThin =
      cairo.copyWith(fontWeight: FontWeight.w100);

  ///FontsSize
  static final TextStyle fontSize40 = TextStyle(fontSize: 40.sp);
  static final TextStyle fontSize28 = TextStyle(fontSize: 28.sp);
  static final TextStyle fontSize23 = TextStyle(fontSize: 23.sp);
  static final TextStyle fontSize20 = TextStyle(fontSize: 20.sp);
  static final TextStyle fontSize17 = TextStyle(fontSize: 17.sp);
  static final TextStyle fontSize15 = TextStyle(fontSize: 15.sp);
  static final TextStyle fontSize14 = TextStyle(fontSize: 14.sp);
  static final TextStyle fontSize13 = TextStyle(fontSize: 13.sp);

  ///FontsColors

  static final TextStyle cairoMedium40green1 =
  cairoMedium.merge(fontSize40).copyWith(color: AppColors.green1);
  static final TextStyle cairoMedium40grey7 =
  cairoMedium.merge(fontSize40).copyWith(color: AppColors.grey7);

  static final TextStyle cairoMedium28black =
  cairoMedium.merge(fontSize28).copyWith(color: AppColors.black);

  static final TextStyle cairoSemiBold23black =
  cairoSemiBold.merge(fontSize23).copyWith(color: AppColors.black);

  static final TextStyle cairoRegular20white =
      cairo.merge(fontSize20).copyWith(color: AppColors.white);
  static final TextStyle cairoBold20white =
      cairoBold.merge(fontSize20).copyWith(color: AppColors.white);
  static final TextStyle cairoBold20black =
  cairoBold.merge(fontSize20).copyWith(color: AppColors.black);
  static final TextStyle cairoBold20blue =
  cairoBold.merge(fontSize20).copyWith(color: AppColors.blue);
  static final TextStyle cairo20grey5 =
  cairo.merge(fontSize20).copyWith(color: AppColors.grey5);

  static final TextStyle cairoSemiBold17white =
  cairoSemiBold.merge(fontSize17).copyWith(color: AppColors.white);


  static final TextStyle cairoMedium15grey1 =
      cairoMedium.merge(fontSize15).copyWith(color: AppColors.grey1);
  static final TextStyle cairoMedium15white =
  cairoMedium.merge(fontSize15).copyWith(color: AppColors.white);
  static final TextStyle cairoBold15white =
  cairoBold.merge(fontSize15).copyWith(color: AppColors.white);
  static final TextStyle cairoMedium15blue =
      cairoMedium.merge(fontSize15).copyWith(color: AppColors.blue);
  static final TextStyle cairoSemiBold15blue =
  cairoSemiBold.merge(fontSize15).copyWith(color: AppColors.blue);
  static final TextStyle cairoLight15grey2 =
      cairoLight.merge(fontSize15).copyWith(color: AppColors.grey2,);
  static final TextStyle cairoLight15black =
  cairoLight.merge(fontSize15).copyWith(color: AppColors.black,);
  static final TextStyle cairo15midNight =
  cairo.merge(fontSize15).copyWith(color: AppColors.midNight);
  static final TextStyle cairo15grey6 =
  cairo.merge(fontSize15).copyWith(color: AppColors.grey6);
  static final TextStyle cairo15red =
  cairo.merge(fontSize15).copyWith(color: AppColors.red);

  static final TextStyle cairo14grey4 =
  cairo.merge(fontSize14).copyWith(color: AppColors.grey4);
  static final TextStyle cairoBold14blue =
  cairoBold.merge(fontSize14).copyWith(color: AppColors.blue);


  static final TextStyle cairoLight13grey =
      cairoLight.merge(fontSize13).copyWith(color: AppColors.grey);
}
