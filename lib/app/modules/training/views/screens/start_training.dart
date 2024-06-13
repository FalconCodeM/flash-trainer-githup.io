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
import 'package:flash_trainer_app_bloc/app/modules/training/views/screens/finishing_training.dart';
import 'package:flash_trainer_app_bloc/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StartTraining extends GetView<TrainingController> {
  const StartTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableBackground(
      children: [
        ReusableAppBar(
          title: AppStrings.appName,
          leftIcon: Icons.arrow_back,
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
                    supTitle: controller.allPodsSelected.length.toString(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h),
            Obx(
              () => ReusableText(
                text: controller.trainingMsg.value,
                textColor: AppColors.primaryElementBg,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            Obx(
              () => ReusableText(
                text:
                    "${(controller.trainingTime.value ~/ 3600).toString().padLeft(2, '0')}:${((controller.trainingTime.value ~/ 60) % 60).toString().padLeft(2, '0')}:${(controller.trainingTime.value % 60).toString().padLeft(2, '0')}",
                textColor: AppColors.primaryText,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 250.h),
          ],
        ),
      ],
    );
  }
}
