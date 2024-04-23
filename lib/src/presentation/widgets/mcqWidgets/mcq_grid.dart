import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/domain/models/level_model.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/mcqWidgets/mcq_item.dart';

class McqGrid extends StatefulWidget {
  final List<McqModel> mcq;

  const McqGrid({super.key, required this.mcq});

  @override
  State<McqGrid> createState() => _McqGridState();
}

class _McqGridState extends State<McqGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
        buildWhen: (state1, state2) => state2 is ChooseAnswerTestState,
        builder: (context, state) {
          return GridView.builder(
              shrinkWrap: true,
              itemCount: widget.mcq.length,
              physics: const NeverScrollableScrollPhysics(),
              // padding: EdgeInsets.only(bottom: 17.h, top: 17.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 1.8 / 1,
              ),
              itemBuilder: (context, index) {
                final mcqModel = widget.mcq[index];
                return McqItem(
                  mcqModel: mcqModel,
                  onTap: () {
                    TestCubit.get(context).chooseAnswer(
                        isAnswer: mcqModel.isAnswer ?? false, index: index);
                  },
                );
              });
        });
  }
}
