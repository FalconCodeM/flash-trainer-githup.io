import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';
import 'reusable_text.dart';

class ReusableTwoText extends StatelessWidget {
  final String title;
  final String supTitle;
  final double titleFontSize;
  final double supTitleFontSize;

  const ReusableTwoText({
    super.key,
    required this.title,
    required this.supTitle,
    this.titleFontSize = 22,
    this.supTitleFontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(
            text: title,
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
          ReusableText(
            text: supTitle,
            fontSize: supTitleFontSize,
            textColor: AppColors.primaryThirdElementText,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
