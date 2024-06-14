import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';
import '../../values/shadows.dart';
import '../../values/strings.dart';
import '../reusable_text.dart';

class PodButton extends StatelessWidget {
  final int count;
  final Color background;
  final Function()? onTap;

  const PodButton({
    super.key,
    required this.count,
    this.background = AppColors.primaryElementBg,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: const [AppShadows.greyShadow],
          ),
          child: ReusableText(
            text: "${AppStrings.pods}  $count",
            textAlign: TextAlign.center,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textColor: AppColors.primaryElementText,
          ),
        ),
      ),
    );
  }
}
