import 'package:flash_trainer_app_bloc/app/data/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AppErrorMsg {
  AppErrorMsg._();

  static toastError({required String msg}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColors.primaryElementBg,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static toastInfo({required String msg}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColors.bluishClr,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static toastSuccess({required String msg}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColors.islamicGreen,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static errorSnackBar({required String errorTitle, required String errorMsg}) {
    return Get.snackbar(
      errorTitle,
      errorMsg,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryElementBg,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
    );
  }
}
