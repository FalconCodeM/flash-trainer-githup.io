import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';
import '../reusable_text.dart';

class DevicesListItem extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String supTitle;

  const DevicesListItem({
    super.key,
    required this.title,
    required this.supTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          children: [
            ReusableText(
              text: title,
              textAlign: TextAlign.center,
            ),
            ReusableText(
              text: supTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Divider(
              thickness: 1,
              color: AppColors.accentColor.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
