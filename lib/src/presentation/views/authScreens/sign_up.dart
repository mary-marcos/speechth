import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/state.dart';
import 'package:speechth/src/presentation/views/authScreens/signUpStages/stage1.dart';
import 'package:speechth/src/presentation/views/authScreens/signUpStages/stage2.dart';
import 'package:speechth/src/presentation/views/authScreens/signUpStages/stage3.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_container.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/logo.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
          final UserCubit signUpCubit = UserCubit.get(context);
          return LoadingOverlay(
            isLoading: signUpCubit.loadingSignUp,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              children: [
                const AppSizedBox(height: 50),
                const Logo(),
                const AppSizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      "Let’s Sign You up",
                      style: AppTextStyle.cairoBold20white,
                    ),
                    const AppSizedBox(height: 10),
                    Text(
                      "Welcome there , We wish you will be better with us",
                      style: AppTextStyle.cairoLight13grey,
                    ),
                  ],
                ),
                const AppSizedBox(height: 35),
                AppContainer(
                  height: 470,
                  child: PageView(
                    controller: signUpCubit.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SignUpStage1(),
                      SignUpStage2(),
                      SignUpStage3(),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        ),
      ),
    );
  }
}
