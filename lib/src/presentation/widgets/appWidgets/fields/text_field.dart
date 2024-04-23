import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/text_styles.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;

  final TextInputType textInput;

  final GestureTapCallback? onTap;


  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter> inputFormatter;

  const AppTextField({
    Key? key,
    this.inputFormatter = const [],
    this.textInput = TextInputType.multiline,
    this.hintText,

    this.controller,
    this.onTap,

    this.onChanged,
    this.textAlign,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      minLines: null,maxLines: null,
      inputFormatters: inputFormatter,
      onChanged: onChanged,
      keyboardType: textInput,
      textAlign: textAlign ?? TextAlign.start,
      controller: controller,
      style: AppTextStyle.cairoMedium15grey1,
      expands: true,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        hintStyle: AppTextStyle.cairoLight15grey2,

        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: contentPadding ??
            EdgeInsets.only(top: 13.h, right: 20.w, bottom: 13.h, left: 10.w),
        // labelText: labelText,
      ),
    );
  }
}
