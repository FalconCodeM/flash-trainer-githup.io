import 'package:flash_trainer_app_bloc/app/data/values/colors.dart';
import 'package:flutter/cupertino.dart';

class AppShadows {
  AppShadows._();

  static const BoxShadow whiteShadow = BoxShadow(
    color: AppColors.primaryElementText,
    blurRadius: 1,
  );


  static const BoxShadow greyShadow = BoxShadow(
    color: AppColors.primaryThirdElementText,
    blurRadius: 5,
    offset: Offset(1, 1),
  );

  static const BoxShadow greyShadowTwo = BoxShadow(
    color: AppColors.primaryFourthElementText,
    blurRadius: 5,
    offset: Offset(1, 1),
  );

}
