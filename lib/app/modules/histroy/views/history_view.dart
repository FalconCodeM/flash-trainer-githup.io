import 'package:flash_trainer_app_bloc/app/data/errors/errors.dart';
import 'package:flash_trainer_app_bloc/app/data/values/colors.dart';
import 'package:flash_trainer_app_bloc/app/data/values/strings.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/items/user_history_list_item.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_app_bar.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_background.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_main_app.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_text.dart';
import 'package:flash_trainer_app_bloc/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/histroy_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableBackground(
      children: [
        ReusableAppBar(
          title: AppStrings.history,
          leftIcon: Icons.arrow_back,
          leftOnTap: () => Get.offAllNamed(Routes.HOME),
        ),
        ReusableMain(
          children: [
            SizedBox(
              height: 670.h,
              child: Obx(
                () {
                  if (controller.users.isEmpty) {
                    return const Center(
                      child: ReusableText(
                        text: 'No Users',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.primaryElementBg,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.users.length,
                        itemBuilder: (context, i) {
                          return Dismissible(
                            key: Key(controller.users[i].userName),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              final deletedUser = controller.users[i];
                              controller.removeUser(deletedUser);
                              AppErrorMsg.toastSuccess(
                                msg: '${deletedUser.userName} deleted',
                              );
                            },
                            background: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryElementBg,
                                borderRadius: BorderRadius.circular(25.w),
                              ),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: const Icon(Icons.delete,
                                  color: AppColors.primaryElementText),
                            ),
                            child: UserHistoryListItem(
                              name: controller.users[i].userName,
                              trainingCount: controller.users[i].training.length
                                  .toString(),
                              onTap: () => controller
                                  .routeToUserHistory(controller.users[i]),
                            ),
                          );
                        });
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
