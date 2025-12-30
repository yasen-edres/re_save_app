import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  TextStyle textStyle;
  void Function()? onPressed;
  final Color borderColor;

  CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textStyle,
    this.borderColor = AppColors.transparentColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
            side: BorderSide(
                color: borderColor,
                width: 2
            )
        ),
      ),
      child: SizedBox(
        height: 64.h,
        width: 398.w,
        child: Center(child: AutoSizeText(text, style: textStyle)),
      ),
    );
  }
}
