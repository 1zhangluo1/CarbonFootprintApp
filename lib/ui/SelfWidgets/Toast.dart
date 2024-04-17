import 'package:get/get.dart';

void Toast(final String title, final String content) {
  if (Get.isSnackbarOpen) {
    Get.back();
    Get.snackbar(title, content);
  } else Get.snackbar(title, content);
 }
