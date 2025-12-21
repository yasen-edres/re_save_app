import 'package:flutter/material.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

import 'app_colors.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: AppColors.darkGreenColor),
              SizedBox(width: 20),
              Text(message, style: AppStyles.bold16Black),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget>? actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(posAction != null){
            //   posAction.call();
            // }
            posAction?.call();
          },
          child: Text(posActionName, style: AppStyles.bold16Green),
        ),
      );
    }
    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(negAction != null){
            //   negAction.call();
            // }
            negAction?.call();
          },
          child: Text(negActionName, style: AppStyles.bold16Green),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message, style: AppStyles.bold16Black),
        title: Text(title ?? '', style: AppStyles.bold16Black),
        actions: actions,
      ),
    );
  }
}
