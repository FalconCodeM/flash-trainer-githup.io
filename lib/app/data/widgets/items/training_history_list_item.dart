import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';
import '../../values/shadows.dart';
import '../reusable_row_two_text.dart';

class TrainingHistoryListItem extends StatelessWidget {
  final String trainingDay;
  final String trainingTime;
  final String podsUsed;
  final Function()? onTap;

  const TrainingHistoryListItem({
    super.key,
    required this.trainingDay,
    required this.trainingTime,
    required this.podsUsed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            color: AppColors.primaryElementText,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: const [AppShadows.greyShadowTwo],
          ),
          child: Column(
            children: [
              ReusableTwoText(
                title: "Training day",
                supTitle: trainingDay,
                titleFontSize: 16,
                supTitleFontSize: 14,
              ),
              ReusableTwoText(
                title: "Training time",
                supTitle: trainingTime,
                titleFontSize: 16,
                supTitleFontSize: 14,
              ),
              ReusableTwoText(
                title: "pods used",
                supTitle: podsUsed,
                titleFontSize: 16,
                supTitleFontSize: 14,
              ),
            ],
          )),
    );
  }
}
