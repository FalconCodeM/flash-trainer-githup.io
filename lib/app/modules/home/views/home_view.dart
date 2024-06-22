import 'package:flash_trainer_app_bloc/app/data/errors/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/values/colors.dart';
import '../../../data/values/images.dart';
import '../../../data/values/strings.dart';
import '../../../data/widgets/reusable_app_bar.dart';
import '../../../data/widgets/reusable_background.dart';
import '../../../data/widgets/reusable_button.dart';
import '../../../data/widgets/reusable_main_app.dart';
import '../../../data/widgets/reusable_text.dart';
import '../../../data/widgets/reusable_text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'screens/bluetooth_screen.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableBackground(
      children: [
        ReusableAppBar(
          title: AppStrings.appName,
          leftIcon: Icons.history,
          leftOnTap: () => Get.offAllNamed(Routes.HISTROY),
          twoIcon: true,
          rightIcon: Icons.bluetooth,
          rightOnTap: () => Get.to(const BluetoothScreen()),
        ),
        ReusableMain(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ReusableText(text: AppStrings.bluetoothDevice),
                  ReusableText(
                    text: controller
                        .getDeviceName(
                            controller.bluetoothServices.connectedDevice.value)
                        .value,
                    textColor: AppColors.primaryElementBg,
                    fontSize: 13,
                  ),
                ],
              ),
            ),
            ReusableTextField(
              hintText: AppStrings.search,
              withImage: true,
              imageName: AppImages.search,
              onChanged: controller.searching,
            ),
            const ReusableText(
              text: AppStrings.homeSupTitle,
              fontSize: 13,
              textColor: AppColors.primaryThirdElementText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.w),
              ),
              child: const Image(
                image: AssetImage(AppImages.Home_page_images),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 210.h),
            ReusableButton(
              title: AppStrings.startTraining,
              background:
                  controller.bluetoothServices.connectedDevice.value != null
                      ? AppColors.primaryElement
                      : AppColors.primaryElementBg,
              onTap: () {
                if (controller.bluetoothServices.connectedDevice.value !=
                    null) {
                  Get.offAllNamed(Routes.TRAINING);
                } else {
                  AppErrorMsg.toastError(msg: "Please connect to device");
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
