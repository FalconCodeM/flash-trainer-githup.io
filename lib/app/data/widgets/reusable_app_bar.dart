import 'package:flash_trainer_app_bloc/app/data/values/colors.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableAppBar extends StatelessWidget {
  final String title;
  final bool twoIcon;
  final IconData leftIcon;
  final Function()? leftOnTap;
  final IconData? rightIcon;
  final Function()? rightOnTap;

  const ReusableAppBar({
    super.key,
    required this.title,
    required this.leftIcon,
    this.twoIcon = false,
    this.leftOnTap,
    this.rightIcon,
    this.rightOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
      child: Row(
        mainAxisAlignment:
            twoIcon ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ReusableIconButton(
                icon: leftIcon,
                onTap: leftOnTap,
              ),
              twoIcon ? Container() : SizedBox(width: 80.w),
            ],
          ),
          Text(
            title,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          twoIcon
              ? ReusableIconButton(
                  icon: rightIcon!,
                  onTap: rightOnTap,
                )
              : Container(),
        ],
      ),
    );
  }
}
