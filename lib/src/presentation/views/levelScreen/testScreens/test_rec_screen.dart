import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/button1.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/audio_text_record.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/record_item.dart';
import 'package:speechth/src/presentation/widgets/levelWidgets/level_track.dart';

class TestRecordScreen extends StatelessWidget {
  const TestRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TestCubit testCubit = TestCubit.get(context);
    return BlocBuilder<TestCubit, TestState>(
        buildWhen: (state1, state2) => state2 is ListenState,
        builder: (context, state) {
          final bool passed = testCubit.testModel?.recognition
                  ?.any((element) => element == testCubit.text) ??
              false;
          return Scaffold(
            backgroundColor: AppColors.white,
            extendBody: true,
            body: SafeArea(
              child: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
                children: [
                  const LevelTrack(),
                  const AppSizedBox(height: 10),
                  AudioTextRecord(
                    text: testCubit.text,
                    audio: testCubit.testModel?.audio ?? '',
                  ),
                  const AppSizedBox(height: 250),
                ],
              ),
            ),
            bottomNavigationBar: passed
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: AppButton1(
                      onTap: () {
                        testCubit.resetText();
                        testCubit.stopSpeech();
                        testCubit.setNextTest(context);
                      },
                      title: "التالي",
                    ),
                  )
                : Container(
                    height: 250.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: AppColors.blue,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40))),
                    child: Center(
                      child: RecordItem(
                        onTap: () {
                          testCubit.listen();
                        },
                      ),
                    ),
                  ),
          );
        });
  }
}
