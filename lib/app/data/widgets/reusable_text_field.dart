import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final double width;
  final bool withImage;
  final String? imageName;
  final bool isPassword;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const ReusableTextField({
    super.key,
    required this.hintText,
    this.width = 320,
    this.withImage = false,
    this.imageName,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
      width: width.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          withImage
              ? Container(
                  width: 16.w,
                  height: 16.h,
                  margin: EdgeInsets.only(left: 17.w),
                  child: Image(image: AssetImage(imageName!)),
                )
              : Container(),
          Container(
            margin: EdgeInsets.only(top: 15.w),
            width: withImage ? 270.w : 290.w,
            height: 50.h,
            child: TextField(
              autocorrect: false,
              obscureText: isPassword ? true : false,
              keyboardType: keyboardType,
              onChanged: onChanged,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
