import 'dart:async';
import 'package:carbon_foot_print/routes/route.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/Toast.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as old;
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/Global.dart';
import '../../models/User.dart';

class ChangePassDialog extends StatelessWidget {
  const ChangePassDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _oldPass = TextEditingController();
    TextEditingController _newPass = TextEditingController();
    TextEditingController _confirmPass = TextEditingController();
    final GlobalKey _formKey = GlobalKey<FormState>();
    RxBool isShowNew = false.obs;
    RxBool isShowConfirm = false.obs;

    return AlertDialog(
      title: Text("修改密码".tr),
      content: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _oldPass,
                decoration: InputDecoration(
                  labelText: "原密码".tr,
                  hintText: "输入原密码验证".tr,
                  // helperText: '用户名',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : "原密码不能为空";
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => TextFormField(
                  controller: _newPass,
                  obscureText: isShowNew.value,
                  decoration: InputDecoration(
                    labelText: "新密码".tr,
                    hintText: "输入新密码".tr,
                    suffixIcon: IconButton(
                      onPressed: () {
                        isShowNew.value = !isShowNew.value;
                      },
                      icon: isShowNew.value
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "新密码不能为空";
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => TextFormField(
                  controller: _confirmPass,
                  obscureText: isShowConfirm.value,
                  decoration: InputDecoration(
                    labelText: "确认新密码".tr,
                    hintText: "再次输入新密码确认".tr,
                    suffixIcon: IconButton(
                      onPressed: () {
                        isShowConfirm.value = !isShowConfirm.value;
                      },
                      icon: isShowConfirm.value
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                  validator: (v) {
                    return v!.trim() == _newPass.text ? null : "两次输入不一致";
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('取消'.tr)),
        ElevatedButton(
            onPressed: () async {
              if ((_formKey.currentState as FormState).validate()) {
                Global.isLogin.value
                    ? changePassword(_oldPass.text, _newPass.text,
                        _confirmPass.text, context)
                    : Toast('请先登录', '检测到目前暂未登录');
              }
            },
            child: Text('确定'.tr)),
      ],
    );
  }

  Future<void> changePassword(String oldPass, String newPass,
      String confirmPass, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString('token') ?? '';
      dios.Dio dio = dios.Dio();
      dio.options.headers = {
        'token': token,
      };
      dios.FormData formData = dios.FormData.fromMap({
        'old_pass': oldPass,
        'new_pass': newPass,
        'confirm_new_pass': confirmPass
      });
      Map<String,dynamic> changeBody = {
        'old_pass': oldPass,
        'new_pass': newPass,
        'confirm_new_pass': confirmPass
      };
      dios.Response response = await dio
          .put('https://www.jzhangluo.com/v1/change_pass', data: changeBody);
      if (response.data['code'] == 200) {
        Global.isLogin.value = false;
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool("isLogin", false);
        Global.profile.value = User(0, "", "");
        old.Fluttertoast.showToast(
            msg: '密码修改成功，请重新登录',
            backgroundColor: Colors.white54,
            textColor: Colors.black);
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(AppRoute.loginPage);
      } else {
        print(response.data['code']);
        print(response.data['msg']);
        old.Fluttertoast.showToast(
            msg: response.data['msg'],
            backgroundColor: Colors.white54,
            textColor: Colors.black);
      }
    } on Exception catch (e) {
      old.Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.white54,
          textColor: Colors.black);
    }
  }
}
