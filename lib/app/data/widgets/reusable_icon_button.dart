import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';
import '../values/shadows.dart';

class ReusableIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;

  const ReusableIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.w),
          color: AppColors.accentColor.withOpacity(0.7),
          boxShadow: const [
            AppShadows.whiteShadow,
          ],
        ),
        child: Icon(
          icon,
          color: AppColors.primaryElementText,
        ),
      ),
    );
  }
}
