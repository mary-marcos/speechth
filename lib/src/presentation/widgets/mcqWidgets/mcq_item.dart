import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';

import '../../../domain/models/level_model.dart';

class McqItem extends StatelessWidget {
  final McqModel? mcqModel;

  final GestureTapCallback? onTap;

  const McqItem({super.key, required this.mcqModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isCorrect = mcqModel?.answer;
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 150.w,
            height: 90.h,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isCorrect != null
                  ? (isCorrect ? AppColors.green1 : AppColors.error2)
                  : AppColors.white3,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(mcqModel?.image ?? ''),
          ),
          if (isCorrect != null)
            Padding(
              padding: EdgeInsets.only(right: 5.w, top: 5.h),
              child: AppSizedBox(
                height: 33,
                width: 33,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: Icon(
                    isCorrect ? Icons.check:Icons.close,
                    color: isCorrect ? AppColors.green1 : AppColors.error2,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
