import 'package:carbon_foot_print/models/items.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/Toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Execute extends StatefulWidget {
  const Execute({super.key, required this.item});

  final Item item;

  @override
  _ExcuteState createState() => _ExcuteState();
}

class _ExcuteState extends State<Execute> {
  final TextEditingController number = TextEditingController(text: "");
  GlobalKey format = GlobalKey<FormState>();

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
                  widget.item.name,
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
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: number,
                    autofocus: false,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                    ],
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 182, 229, 205),
                                width: 2)),
                        hintText: "数量",
                        border: OutlineInputBorder(
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
                  widget.item.type,
                  textScaleFactor: 1.4,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  if (number.text.isNotEmpty) {
                    showResult(111);
                  } else if (number.text.isEmpty) {
                    Toast("错误提醒", "输入不能为空哦");
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 93, 236, 164),
                    minimumSize: const Size(200, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: const Text(
                  "计算",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }

  void showResult(double number) {
    Get.dialog(
      result,
      useSafeArea: false,
      barrierDismissible: false,);
  }

  AlertDialog result = AlertDialog(
    title: const Text("计算结果"),
    content: const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(text: "您本次排放CO2的量为："),
          TextSpan(text: "10.5kg", style: TextStyle(color: Colors.green))
        ]),textScaleFactor: 1.3,),
        Text.rich(TextSpan(children: [
          TextSpan(text: "您需要种植"),
          TextSpan(text: "1.1", style: TextStyle(color: Colors.green)),
          TextSpan(text: "棵树来抵消您的碳排放"),
        ]),textScaleFactor: 1.3,),
      ],
    ),
    actions: [
      TextButton(onPressed: () {Get.back();}, child: const Text("返回")),
      TextButton(onPressed: () {}, child: const Text("保存")),
    ],
  );
}
