import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/button1.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/audio_listen.dart';
import 'package:speechth/src/presentation/widgets/levelWidgets/level_track.dart';
import 'package:speechth/src/presentation/widgets/mcqWidgets/mcq_grid.dart';

class TestMcqScreen extends StatelessWidget {
  const TestMcqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TestCubit testCubit = TestCubit.get(context);
    final mcq = testCubit.testModel?.mcq;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.0.h),
          children: [
            const LevelTrack(),
            const AppSizedBox(height: 10),
            AudioListen(audio: testCubit.testModel?.audio ?? ""),
            Center(
              child: Text("استمع واختر الإجابة الصحيحة",
                  style: AppTextStyle.cairo20grey5),
            ),
            const AppSizedBox(height: 10),
            McqGrid(
              mcq: mcq ?? [],
            ),
            const AppSizedBox(height: 15),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<TestCubit,TestState>(
        buildWhen: (state1,state2)=>state2 is ChooseAnswerTestState,
        builder: (context,state) {
          final passed = mcq?.any((element) => element.answer ?? false) ?? false;
          return passed? Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: AppButton1(
              onTap: () {
                testCubit.setNextTest(context);
              },
              title: "التالي",
            ),
          ):const SizedBox();
        }
      ),
    );
  }
}
