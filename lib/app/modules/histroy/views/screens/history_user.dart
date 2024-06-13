import 'package:flash_trainer_app_bloc/app/data/errors/errors.dart';
import 'package:flash_trainer_app_bloc/app/data/models/users.dart';
import 'package:flash_trainer_app_bloc/app/data/values/colors.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/items/training_history_list_item.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_app_bar.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_background.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_main_app.dart';
import 'package:flash_trainer_app_bloc/app/data/widgets/reusable_text.dart';
import 'package:flash_trainer_app_bloc/app/modules/histroy/controllers/histroy_controller.dart';
import 'package:flash_trainer_app_bloc/app/modules/histroy/views/screens/history_tarining.dart';
import 'package:flash_trainer_app_bloc/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryUser extends GetView<HistoryController> {
  final Users users;

  const HistoryUser({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ReusableBackground(
      children: [
        ReusableAppBar(
          title: users.userName,
          leftIcon: Icons.arrow_back,
          leftOnTap: () => Get.offAllNamed(Routes.HISTROY),
          rightIcon: Icons.home,
          rightOnTap: () => Get.offAllNamed(Routes.HOME),
          twoIcon: true,
        ),
        ReusableMain(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: users.training.isNotEmpty
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              if (users.training.isEmpty) ...[
                SizedBox(
                  height: 660.h,
                  child: const Center(
                    child: ReusableText(
                      text: "No Training",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.primaryElementBg,
                    ),
                  ),
                )
              ],
              if (users.training.isNotEmpty) ...[
                Container(
                  height: 650.h,
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.training.length,
                    itemBuilder: (context, i) {
                      return Dismissible(
                        key: Key(users.training[i].trainingTime),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          final deletedUser = users.training[i];
                          controller.removeTraining(
                              deletedUser, users.userName);
                          AppErrorMsg.toastInfo(
                            msg: 'training deleted',
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
                        child: TrainingHistoryListItem(
                          onTap: () => Get.to(
                            HistoryTraining(
                              trainingResult: users.training[i],
                              userName: users.userName,
                            ),
                          ),
                          trainingDay: users.training[i].trainingDay,
                          trainingTime: users.training[i].trainingTime,
                          podsUsed: users.training[i].podsUsedCount.toString(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ],
          ),
        ]),
      ],
    );
  }
}
