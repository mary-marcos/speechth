import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/state.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/state.dart';
import 'package:speechth/src/presentation/views/levelScreen/testScreens/test_audio_screen.dart';
import 'package:speechth/src/presentation/views/levelScreen/testScreens/test_mcq_screen.dart';
import 'package:speechth/src/presentation/views/levelScreen/testScreens/test_rec_screen.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/loading_widget.dart';
import 'package:speechth/src/utils/strings/routes_names.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = UserCubit.get(context);
    final userModel = userCubit.userModel;
    final int level = int.tryParse(userModel?.level ?? "") ?? 1;
    final int category = int.tryParse(userModel?.category ?? "") ?? 1;
    final int test = int.tryParse(userModel?.test ?? "") ?? 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.homeScreen, (route) => false);
        return false;
      },
      child: BlocProvider(
        create: (BuildContext context) => TestCubit(level, category, test),
        lazy: false,
        child: BlocBuilder<UserCubit, UserState>(
            buildWhen: (state1, state2) =>
                state2 is SetCurrentTestLoading ||
                state2 is SetCurrentTestSuccess ||
                state2 is SetCurrentTestError,
            builder: (context, state) {
              return state is SetCurrentTestLoading
                  ? const LoadingWidget()
                  : BlocBuilder<TestCubit, TestState>(
                      buildWhen: (state1, state2) =>
                          state2 is ChangeCurrentTestState ||
                          state2 is LoadTestSuccess ||
                          state2 is LoadTestLoading,
                      builder: (context, state) {
                        final TestCubit testCubit = TestCubit.get(context);
                        final int currentTest = testCubit.currentTest;
                        return state is LoadTestLoading
                            ? const Scaffold(
                                body:
                                    Center(child: CircularProgressIndicator()))
                            : currentTest == 1
                                ? const TestAudioScreen()
                                : currentTest == 2
                                    ? const TestRecordScreen()
                                    : currentTest == 3
                                        ? const TestMcqScreen()
                                        : Scaffold(
                                            backgroundColor: AppColors.white,
                                            body: SafeArea(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                        "We are working task",
                                                        style: AppTextStyle
                                                            .cairoMedium28black),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator
                                                            .pushNamedAndRemoveUntil(
                                                                context,
                                                                RouteName
                                                                    .homeScreen,
                                                                (route) =>
                                                                    false);
                                                      },
                                                      child: Text("Go Back",
                                                          style: TextStyle(
                                                              fontSize: 24.sp)))
                                                ],
                                              ),
                                            ),
                                          );
                      });
            }),
      ),
    );
  }
}
