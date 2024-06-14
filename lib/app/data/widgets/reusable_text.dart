import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/colors.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final Color textColor;
  final FontWeight fontWeight;

  const ReusableText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.fontSize = 14,
    this.textColor = AppColors.primaryText,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
