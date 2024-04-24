import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void closeKeyboard(FocusNode focusNode) {
  if (focusNode.hasFocus) {
    focusNode.unfocus();
  }
}

class DetailBinding extends Bindings {

  final FocusNode focusNode;

  DetailBinding({
    required this.focusNode,
});

  @override
  void dependencies() {
    closeKeyboard(focusNode);
  }
}
