import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';

class AppDropList<T> extends StatelessWidget {
  final List<T> list;
  final String? hint, labelText;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;


  const AppDropList(
      {Key? key,
      required this.list,
      this.hint,
      this.value,
      this.onChanged,
      this.validator,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        fit: FlexFit.loose,
        menuProps: const MenuProps(backgroundColor: AppColors.white),
        itemBuilder: (context, t, d) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Text(
            t.toString(),
            style: AppTextStyle.cairoLight15black,
          ),
        ),
        showSearchBox: false,
        searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: 'ابحث .......',
              filled: true,
              fillColor: AppColors.white,
              border: null,
              hintStyle: AppTextStyle.cairoLight15grey2,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.transparent),
              ),
              enabled: true,
              contentPadding: EdgeInsets.only(
                  top: 13.h, right: 13.w, bottom: 13.h, left: 13.w),
              // labelText: labelText,
            ),
            style: AppTextStyle.cairoLight15black),
      ),
      items: list,
      validator: validator,
      dropdownButtonProps: DropdownButtonProps(
          // padding: EdgeInsets.only(left: 10.w),
          iconSize: 24.r,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.black,
          )),
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: AppTextStyle.cairoLight15grey2,
        textAlign: TextAlign.left,
        dropdownSearchDecoration: InputDecoration(
          hintText: hint,

          filled: true,
          labelText: labelText,
          floatingLabelStyle: AppTextStyle.cairoLight15black,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: AppColors.white,
          border: null,
          hintStyle: AppTextStyle.cairoLight15grey2,
          labelStyle: AppTextStyle.cairoLight15black,
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.error)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.green1)),
          enabled: true,
          contentPadding:
              EdgeInsets.only(top: 13.h, right: 20.w, bottom: 13.h, left: 10.w),
          // labelText: labelText,
        ),
      ),
      onChanged: onChanged,
      selectedItem: value,
    );
  }
}
