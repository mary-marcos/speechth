import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/app_shadows.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/back_button.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/homeWidgets/user_picture.dart';
import 'package:speechth/src/presentation/widgets/profileWidgets/profile_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = UserCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        final userModel = userCubit.userModel;
        return SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            children: [
              const AppSizedBox(height: 40),
              const AppBackButton(),
              const AppSizedBox(height: 60),
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: AppShadows.shadow1,
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      children: [
                        const AppSizedBox(height: 50),
                        ProfileRow(
                            image: Assets.svgUser,
                            text: userModel?.childName ?? ""),
                        ProfileRow(
                            image: Assets.svgGender,
                            text: userModel?.gender ?? ""),
                        ProfileRow(
                            image: Assets.svgMail,
                            text: userModel?.email ?? ""),
                        ProfileRow(
                            image: Assets.svgList,
                            text: userModel?.description ?? ""),
                        ProfileRow(
                            image: Assets.svgCallender,
                            text: userModel?.dateOfBirth ?? 'DD/MM/YY'),
                        ProfileRow(
                            image: Assets.svgList,
                            text: "المستوي ${userModel?.level ?? ''}"),
                        ProfileRow(
                            image: Assets.imagesStar,
                            isSvg: false,
                            text: "النقاط ${userModel?.points ?? ''}"),
                      ],
                    ),
                  ),
                  const Positioned(top: -50, child: UserPicture())
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
