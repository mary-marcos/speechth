import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/button1.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/audio_listen.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/record_item.dart';
import 'package:speechth/src/presentation/widgets/levelWidgets/level_track.dart';

class TestAudioScreen extends StatelessWidget {
  const TestAudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TestCubit testCubit = TestCubit.get(context);

    return BlocBuilder<TestCubit, TestState>(
        buildWhen: (state1, state2) => state2 is ListenState,
        builder: (context, state) {
          final testModel = testCubit.testModel;
          final bool passed = testCubit.testModel?.recognition
                  ?.any((element) => element == testCubit.text) ??
              false;
          print(passed);
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(85)),
                      color: Colors.white),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AppSizedBox(height: 20),
                        const LevelTrack(),
                        const AppSizedBox(height: 30),
                        AudioListen(audio: testModel?.audio ?? ""),
                        const AppSizedBox(height: 20),
                        Text("دوس هنا .... و اسمع",
                            style: AppTextStyle.cairoBold20blue),
                        const AppSizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const AppSizedBox(height: 50),
                if (!passed)
                  RecordItem(
                    onTap: () {
                      testCubit.listen();
                    },
                  ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: passed
                ? Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: AppButton1(
                      width: double.infinity,
                      onTap: () {
                        testCubit.resetText();
                        testCubit.stopSpeech();
                        testCubit.setNextTest(context);
                      },
                      title: "التالي",
                    ),
                  )
                : null,
          );
        });
  }
}
