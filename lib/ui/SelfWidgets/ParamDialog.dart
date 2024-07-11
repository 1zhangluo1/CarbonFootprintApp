import 'dart:async';
import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/models/items.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/Toast.dart';
import 'package:fluttertoast/fluttertoast.dart' as old;

class ParamDialog extends StatelessWidget {
  final Item item;

  ParamDialog(this.item);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("计算结果".tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "您本次排放CO2的量为：".tr),
              TextSpan(
                  text: item.result.toStringAsFixed(2).toString(),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              TextSpan(text: "kg"),
            ]),
            textScaleFactor: 1.3,
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "您需要种植".tr),
              TextSpan(
                  text: item.tree.toStringAsFixed(2).toString(),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              TextSpan(text: "棵树来抵消您的碳排放".tr),
            ]),
            textScaleFactor: 1.3,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("返回".tr)),
        TextButton(
            onPressed: () => Global.isLogin.value
                ? SaveCalculateResult(item, context)
                : old.Fluttertoast.showToast(
                    msg: '请先登录'.tr,
                    fontSize: 17,
                    gravity: old.ToastGravity.SNACKBAR,
                    backgroundColor: Colors.white54,
                    textColor: Colors.black),
            child: Text("保存".tr)),
      ],
    );
  }

  Future<void> SaveCalculateResult(Item item, BuildContext context) async {
    try {
      String tree = '需要种植${item.tree.toStringAsFixed(2)}棵树来抵消此次碳排放';
      Map<String, dynamic> body = {
        'calculate_result': double.parse(item.result.toStringAsFixed(2)),
        'use_type': item.type,
        'use_name': item.name,
        'use_counts': double.parse(item.num.toStringAsFixed(2)),
        'remedial_measure': tree,
        'type': item.classes,
      };
      dios.Dio dio = dios.Dio();
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("token") ?? "";
      dio.options.headers = {
        'token': token,
      };
      dios.Response response = await dio
          .post('https://carbon.jzhangluo.com/v1/save_calculate', data: body);
      if (response.data['code'] == 200) {
        Toast("保存成功", "");
        Navigator.of(context).pop();
      } else {
        Toast("保存失败", response.data['msg']);
      }
    } catch (e) {
      Toast("ERROR:", e.toString());
    }
  }
}
