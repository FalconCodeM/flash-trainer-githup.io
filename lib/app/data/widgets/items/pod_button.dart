import 'package:flash_trainer_app_bloc/app/data/values/colors.dart';
import 'package:flash_trainer_app_bloc/app/data/values/shadows.dart';
import 'package:flash_trainer_app_bloc/app/data/values/strings.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
