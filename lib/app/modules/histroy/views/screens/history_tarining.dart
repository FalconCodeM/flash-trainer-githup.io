import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/models/users.dart';
import '../../../../data/values/colors.dart';
import '../../../../data/values/shadows.dart';
import '../../../../data/values/strings.dart';
import '../../../../data/widgets/reusable_app_bar.dart';
import '../../../../data/widgets/reusable_background.dart';
import '../../../../data/widgets/reusable_main_app.dart';
import '../../../../data/widgets/reusable_row_two_text.dart';
import '../../../../data/widgets/reusable_text.dart';
import '../../../../routes/app_pages.dart';

class HistoryTraining extends StatelessWidget {
  final TrainingModel trainingResult;
  final String userName;

  const HistoryTraining({
    super.key,
    required this.trainingResult,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableBackground(
      children: [
        ReusableAppBar(
          title: "Training History",
          leftIcon: Icons.history,
          leftOnTap: () => Get.offAllNamed(Routes.HISTROY),
          rightIcon: Icons.home,
          rightOnTap: () => Get.offAllNamed(Routes.HOME),
          twoIcon: true,
        ),
        ReusableMain(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color: AppColors.backgroundDark.withOpacity(0.1),
                boxShadow: const [AppShadows.whiteShadow],
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Column(
                children: [
                  ReusableTwoText(
                    title: AppStrings.name,
                    supTitle: userName,
                  ),
                  ReusableTwoText(
                    title: AppStrings.time,
                    supTitle: trainingResult.trainingTime,
                  ),
                  ReusableTwoText(
                    title: AppStrings.day,
                    supTitle: trainingResult.trainingDay,
                  ),
                  ReusableTwoText(
                    title: AppStrings.usedPods,
                    supTitle: trainingResult.podsUsedCount.toString(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: AppStrings.activePodCount,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.primaryThirdElementText,
                  ),
                  ReusableText(
                    text: AppStrings.wrongTouch,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.primaryElementBg,
                  ),
                  ReusableText(
                    text: AppStrings.rightTouch,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.primaryElementStatus,
                  ),
                  ReusableText(
                    text: AppStrings.averageTime,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.primaryElement,
                  ),
                ],
              ),
            ),
            Container(
              height: 350.h,
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 0.h,
                  childAspectRatio: 6.h,
                  // mainAxisExtent: 4,
                ),
                shrinkWrap: true,
                itemCount: trainingResult.pods.isNotEmpty
                    ? trainingResult.pods.length
                    : 1,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: trainingResult.pods[i].activePods,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryThirdElementText,
                          textAlign: TextAlign.center,
                        ),
                        ReusableText(
                          text: trainingResult.pods[i].wrongTouch,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                          textColor: AppColors.primaryElementBg,
                        ),
                        ReusableText(
                          text: trainingResult.pods[i].rightTouch,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryElementStatus,
                          textAlign: TextAlign.center,
                        ),
                        ReusableText(
                          text: trainingResult.pods[i].averageTime,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryElement,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ],
    );
  }
}
