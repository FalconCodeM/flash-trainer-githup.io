import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/values/strings.dart';
import '../../../data/widgets/items/pod_button.dart';
import '../../../data/widgets/reusable_app_bar.dart';
import '../../../data/widgets/reusable_background.dart';
import '../../../data/widgets/reusable_button.dart';
import '../../../data/widgets/reusable_main_app.dart';
import '../../../data/widgets/reusable_text.dart';
import '../../../data/widgets/reusable_text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/training_controller.dart';

class TrainingView extends GetView<TrainingController> {
  const TrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableBackground(
      children: [
        ReusableAppBar(
          title: AppStrings.setSettings,
          leftIcon: Icons.arrow_back,
          leftOnTap: () => Get.offAllNamed(Routes.HOME),
        ),
        ReusableMain(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ReusableText(
                    text: AppStrings.name,
                    textAlign: TextAlign.start,
                  ),
                  ReusableTextField(
                    hintText: AppStrings.enterName,
                    onChanged: (value) => controller.checkName(value),
                  ),
                  const ReusableText(
                    text: AppStrings.time,
                    textAlign: TextAlign.start,
                  ),
                  ReusableTextField(
                    hintText: AppStrings.enterTime,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => controller.checkTime(value),
                  ),
                  const ReusableText(
                    text: AppStrings.activePods,
                    fontSize: 16,
                  ),
                  Container(
                    height: 300.h,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.w,
                        childAspectRatio: 2.5.h,
                        // mainAxisExtent: 4,
                      ),
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, i) {
                        return Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PodButton(
                                onTap: () => controller.selectPod(i + 1),
                                count: i + 1,
                                background: controller.podIsActive(i + 1),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ReusableButton(
                    title: AppStrings.startTraining,
                    onTap: controller.startTraining,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
