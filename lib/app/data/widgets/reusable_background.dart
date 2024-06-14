import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class ReusableBackground extends StatelessWidget {
  final List<Widget> children;

  const ReusableBackground({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.accentColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
