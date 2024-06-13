import 'package:flash_trainer_app_bloc/app/data/values/colors.dart';
import 'package:flash_trainer_app_bloc/app/data/values/images.dart';
import 'package:flash_trainer_app_bloc/app/data/values/strings.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_app_bar.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_background.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_button.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_main_app.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_text.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_text_field.dart';
import 'package:flash_trainer_app_bloc/app/modules/home/views/screens/bluetooth_screen.dart';
import 'package:flash_trainer_app_bloc/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

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
                  Obx(
                    () => ReusableText(
                      text:
                          (controller.bluetoothServices.connectedDevice.value !=
                                  null)
                              ? controller.bluetoothServices.connectedDevice
                                      .value!.advName.isEmpty
                                  ? controller.bluetoothServices.connectedDevice
                                      .value!.advName
                                  : 'Unknown Device'
                              : AppStrings.noDevice,
                      textColor: AppColors.primaryElementBg,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            ReusableTextField(
              hintText: AppStrings.search,
              withImage: true,
              imageName: AppImages.search,
              onChanged: (value) {},
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
              onTap: () => Get.offAllNamed(Routes.TRAINING),
            ),
          ],
        ),
      ],
    );
  }
}
