import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/values/colors.dart';
import '../../../../data/values/strings.dart';
import '../../../../data/widgets/items/devices_list_item.dart';
import '../../../../data/widgets/reusable_app_bar.dart';
import '../../../../data/widgets/reusable_background.dart';
import '../../../../data/widgets/reusable_button.dart';
import '../../../../data/widgets/reusable_main_app.dart';
import '../../../../data/widgets/reusable_text.dart';
import '../../controllers/home_controller.dart';

class BluetoothScreen extends GetView<HomeController> {
  const BluetoothScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableBackground(
      children: [
        ReusableAppBar(
          title: AppStrings.bluetoothScreen,
          leftIcon: Icons.arrow_back,
          leftOnTap: Get.back,
        ),
        ReusableMain(
          children: [
            SizedBox(
              height: 600.h,
              child: StreamBuilder<List<ScanResult>>(
                stream: controller.bluetoothServices.scanResultsStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: ReusableText(
                        text: 'No devices found',
                        textColor: AppColors.primaryElementBg,
                      ),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final result = snapshot.data![index];
                        return DevicesListItem(
                          title: controller.getDeviceName(result.device).value,
                          supTitle: result.device.id.toString(),
                          onTap: () => controller.bluetoothServices
                              .connectToDevice(result.device),
                        );
                      });
                },
              ),
            ),
            SizedBox(height: 20.h),
            Obx(
              () => ReusableButton(
                onTap: () => controller.bluetoothServices.isScanning.value
                    ? controller.bluetoothServices.stopScan()
                    : controller.bluetoothServices.startScan(),
                title: controller.bluetoothServices.isScanning.value
                    ? AppStrings.stopScan
                    : AppStrings.startScan,
                background: controller.bluetoothServices.isScanning.value
                    ? AppColors.primaryElementBg
                    : AppColors.primaryElement,
              ),
            ),
          ],
        )
      ],
    );
  }
}
