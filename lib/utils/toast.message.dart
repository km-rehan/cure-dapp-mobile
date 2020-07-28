import 'package:flutter/material.dart';
import 'package:utopic_toast/utopic_toast.dart';

class ToastFunctions {
  static void showToast(String message,
      {String actionText,
      Color textColor,
      ToastType type,
      Function() onPress,
      int forDuration}) {
    ToastManager().showToast(message,
        type: type,
        action: ToastAction(
            label: actionText,
            textColor: textColor,
            onPressed: (dismissToast) {
              if (onPress != null) {
                onPress();
                dismissToast();
              }
              dismissToast();
            }),
        duration: forDuration != null ? Duration(seconds: forDuration) : null);
  }
}
