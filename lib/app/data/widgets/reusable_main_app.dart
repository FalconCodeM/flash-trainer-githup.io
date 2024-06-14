import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';
import '../values/shadows.dart';

class ReusableMain extends StatelessWidget {
  final List<Widget> children;

  const ReusableMain({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: AppColors.primaryElementText,
        borderRadius: BorderRadius.circular(30.w),
        boxShadow: const [
          AppShadows.greyShadow,
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
