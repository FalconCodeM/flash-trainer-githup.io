import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';
import '../../values/shadows.dart';
import '../../values/strings.dart';
import '../reusable_text.dart';

class UserHistoryListItem extends StatelessWidget {
  final String name;
  final String trainingCount;
  final Function()? onTap;

  const UserHistoryListItem({
    super.key,
    required this.name,
    required this.trainingCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 20.w,
        ),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: AppColors.primaryElementText,
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: const [
            AppShadows.greyShadowTwo,
            AppShadows.whiteShadow,
            AppShadows.whiteShadow,
          ],
        ),
        child: Column(
          children: [
            ReusableText(
              text: name,
              textAlign: TextAlign.center,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(
                  text: AppStrings.trainingCount,
                  fontSize: 14,
                  textColor: AppColors.primarySecondaryElementText,
                  fontWeight: FontWeight.w400,
                ),
                ReusableText(
                  text: trainingCount,
                  textColor: AppColors.primaryFourthElementText,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
