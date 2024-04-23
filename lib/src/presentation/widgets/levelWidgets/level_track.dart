import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/app_shadows.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/progressIndicator/app_progress_indicator.dart';

class LevelTrack extends StatelessWidget {
  const LevelTrack({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = UserCubit.get(context);
    final userModel = userCubit.userModel;
    final level = userModel?.level ?? '1';
    final points = userModel?.points ?? '1';
    final levelProgress = double.tryParse(userModel?.levelProgress ?? '')??0.0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: AppShadows.shadow1,
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "المستوى $level",
                style: AppTextStyle.cairo14grey4,
              ),
              const Spacer(),
              Image.asset(
                Assets.imagesStar,
                width: 40.w,
                height: 40.h,
              ),
              Text("$points نقاط", style: AppTextStyle.cairoBold14blue)
            ],
          ),
          const AppSizedBox(height: 10),
           AppProgressIndicator(percent: levelProgress)
        ],
      ),
    );
  }
}
