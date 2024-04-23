import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText, labelText;
  final TextEditingController? controller;
  final bool obscureText, readOnly;
  final TextInputType textInput;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final Widget? icon, fixIcon;

  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onSubmit, onChanged;
  final List<TextInputFormatter> inputFormatter;

  const AppTextFormField({
    Key? key,
    this.inputFormatter = const [],
    this.textInput = TextInputType.text,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onTap,
    this.icon,
    this.fixIcon,
    this.onChanged,
    this.textAlign,
    this.contentPadding,
    this.onSubmit,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      minLines: 1,
      readOnly: readOnly,
      inputFormatters: inputFormatter,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      keyboardType: textInput,
      textAlign: textAlign ?? TextAlign.start,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      obscuringCharacter: "*",
      style: AppTextStyle.cairoMedium15grey1,
      textDirection: TextDirection.ltr,
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: TextDirection.ltr,

        labelText: labelText,floatingLabelStyle: AppTextStyle.cairoLight15black,floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: icon,
        suffixIcon: fixIcon,
        filled: true,

        fillColor: AppColors.white,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.error)),
        hintStyle: AppTextStyle.cairoLight15grey2,
        labelStyle: AppTextStyle.cairoLight15black,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.green1)),
        contentPadding: contentPadding ??
            EdgeInsets.only(top: 13.h, right: 20.w, bottom: 13.h, left: 10.w),
        // labelText: labelText,
      ),
    );
  }
}
