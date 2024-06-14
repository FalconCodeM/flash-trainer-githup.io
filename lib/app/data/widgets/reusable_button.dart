import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';
import '../values/shadows.dart';
import 'reusable_text.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color background;
  final Color textColor;

  const ReusableButton({
    super.key,
    required this.title,
    this.background = AppColors.primaryElement,
    this.textColor = AppColors.primaryElementText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: const [AppShadows.greyShadow],
        ),
        child: ReusableText(
          text: title,
          textColor: textColor,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          fontSize: 24,
        ),
      ),
    );
  }
}
