import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/models/items.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/ParamDialog.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/Toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../gen/assets.gen.dart';

class Execute extends StatefulWidget {
  const Execute({super.key, required this.item});

  final Item item;

  @override
  _ExcuteState createState() => _ExcuteState();
}

class _ExcuteState extends State<Execute> {
  final TextEditingController number = TextEditingController();
  GlobalKey format = GlobalKey<FormState>();
  late ParamDialog dialog;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    widget.item.name.tr,
                    textScaleFactor: 1.4,
                  ),
                ),
                Container(
                  width: 110,
                  height: 50,
                  child: Form(
                    key: format,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: TextFormField(
                      focusNode: Global.focusNode_cal,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: number,
                      autofocus: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                      ],
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 182, 229, 205),
                                  width: 2)),
                          hintText: "数量".tr,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    textAlign: TextAlign.right,
                    widget.item.type.tr,
                    textScaleFactor: 1.4,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (isNumeric(number.text)) {
                      widget.item.num = double.parse(number.text);
                      widget.item.calculateResult(double.parse(number.text));
                      if (Global.focusNode_cal.hasFocus)
                        Global.focusNode_cal.unfocus();
                      ParamDialog dialog = ParamDialog(widget.item);
                      showResult(dialog);
                    } else if (number.text.isEmpty) {
                      Toast("提醒".tr, "输入不能为空哦".tr);
                    } else
                      Toast("提醒".tr, "请规范输入".tr);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 93, 236, 164),
                      minimumSize: const Size(200, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  child: Text(
                    "计算".tr,
                    textScaleFactor: 1.3,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ));
  }

  bool isNumeric(String str) {
    if (str == '') {
      return false;
    }
    return double.tryParse(str) != null;
  }

  void showResult(ParamDialog dialog) {
    Get.dialog(
      dialog,
      useSafeArea: false,
      barrierDismissible: false,
    );
  }
}
