import 'package:flash_trainer_app_bloc/app/data/values/colors.dart';
import 'package:flash_trainer_app_bloc/app/data/values/shadows.dart';
import 'package:flash_trainer_app_bloc/app/data/values/strings.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_app_bar.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_background.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_button.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_main_app.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_row_two_text.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_text.dart';
import 'package:flash_trainer_app_bloc/app/modules/training/controllers/training_controller.dart';
import 'package:flash_trainer_app_bloc/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FinishingTraining extends GetView<TrainingController> {
  const FinishingTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableBackground(
      children: [
        ReusableAppBar(
          title: AppStrings.trainingFinishing,
          leftIcon: Icons.arrow_back,
          twoIcon: true,
          rightIcon: Icons.history,
          rightOnTap: () => Get.offAllNamed(Routes.HISTROY),
          leftOnTap: () => Get.offAllNamed(Routes.TRAINING),
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
                    supTitle: controller.name.value,
                  ),
                  ReusableTwoText(
                    title: AppStrings.time,
                    supTitle: controller.time.value,
                  ),
                  ReusableTwoText(
                    title: AppStrings.activePodCount,
                    supTitle: controller
                            .bluetoothServices.podsActiveNumbers.isNotEmpty
                        ? controller.bluetoothServices.podsActiveNumbers.length
                            .toString()
                        : "0",
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
                itemCount:
                    controller.bluetoothServices.podsActiveNumbers.isNotEmpty
                        ? controller.bluetoothServices.podsActiveNumbers.length
                        : 1,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: controller.bluetoothServices.podsActiveNumbers
                                  .isNotEmpty
                              ? controller
                                  .bluetoothServices.podsActiveNumbers[i]
                                  .toString()
                              : "0",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryThirdElementText,
                          textAlign: TextAlign.center,
                        ),
                        ReusableText(
                          text: controller.bluetoothServices.wrongTouchNumbers
                                  .isNotEmpty
                              ? controller
                                  .bluetoothServices.wrongTouchNumbers[i]
                                  .toString()
                              : "0",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                          textColor: AppColors.primaryElementBg,
                        ),
                        ReusableText(
                          text: controller.bluetoothServices.rightTouchNumbers
                                  .isNotEmpty
                              ? controller
                                  .bluetoothServices.rightTouchNumbers[i]
                                  .toString()
                              : "0",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryElementStatus,
                          textAlign: TextAlign.center,
                        ),
                        ReusableText(
                          text: controller.bluetoothServices.averageTimeNumbers
                                  .isNotEmpty
                              ? controller
                                  .bluetoothServices.averageTimeNumbers[i]
                                  .toString()
                              : "0",
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
            ReusableButton(
              title: AppStrings.save,
              onTap: controller.saveTrainingData,
            ),
          ],
        ),
      ],
    );
  }
}
