import 'package:dialog_helper/models/dialogButton.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_configuration_service/appInfo.config.dart';

class DialogsHelper {
  /* show error dialog with one okay button */
  static Future<dynamic> show({
    String? title,
    required String content,
    DialogButton? button,
    bool yesBtn = true,
    bool okBtn = false,
    bool barrierDismissible = true,
  }) async {
    return await Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppConfigService.to.radius,
          ),
        ),
        title: title == null ? null : Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text(okBtn ? 'Ok'.tr : 'No'.tr),
            onPressed: () => Get.back(result: false),
          ),
          if (yesBtn)
            TextButton(
              child: Text('Yes'.tr),
              onPressed: () => Get.back(result: true),
            ),
          if (button != null)
            TextButton(
              child: Text(button.label!),
              onPressed: () => Get.back(result: button.payload),
            ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  /* show error dialog with one okay button */
  static Future<dynamic> message({
    required String content,
    String? title,
  }) async {
    return await show(
      title: title,
      content: content,
      okBtn: true,
      yesBtn: false,
    );
  }
}
