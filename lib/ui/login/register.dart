import 'dart:async';
import 'package:carbon_foot_print/ui/SelfWidgets/Toast.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
  });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController =
      TextEditingController(text: "");
  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");
  final TextEditingController _checkNumController =
      TextEditingController(text: "");
  FocusScopeNode? focusScopeNode;
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool isSendCheckNum = false;
  bool isClickSend = false;
  int countTime = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text("注册新账户".tr),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0,
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(children: [
                            TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: "昵称".tr,
                                hintText: "输入您的昵称".tr,
                                prefixIcon: const Icon(Icons.person),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              ),
                              validator: (v) {
                                return v!.trim().isNotEmpty ? null : "昵称不能为空".tr;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "邮箱".tr,
                                hintText: "输入您的邮箱".tr,
                                prefixIcon: Icon(Icons.email_outlined),
                                // helperText: '用户名',
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              ),
                              validator: (v) {
                                return v!.trim().isNotEmpty ? null : "邮箱不能为空".tr;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: "密码".tr,
                                hintText: "密码至少6位数".tr,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    //根据passwordVisible状态显示不同的图标
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    //更新状态控制密码显示或隐藏
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                // helperText: '密码',
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              ),
                              validator: (v) {
                                return v!.trim().length >= 6 ? null : "密码至少6位数".tr;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _checkNumController,
                              decoration: InputDecoration(
                                labelText: "验证码".tr,
                                hintText: "输入您的验证码".tr,
                                prefixIcon: const Icon(Icons.person),
                                suffixIcon: IconButton(
                                  onPressed: isClickSend
                                      ? () {
                                          Toast("发送中".tr, "请耐心等待".tr);
                                        }
                                      : () {
                                          if (_emailController.text.isEmpty) {
                                            Toast("请先填写邮箱".tr, "");
                                          } else if (isSendCheckNum) {
                                            Toast("已发送验证码,请勿重复点击".tr, "");
                                          }
                                          if (_emailController
                                                  .text.isNotEmpty &&
                                              !isSendCheckNum) {
                                            sendCode(_emailController.text);
                                          }
                                        },
                                  icon: isSendCheckNum
                                      ? Text(
                                          "$countTime" "s",
                                          textScaleFactor: 1.2,
                                        )
                                      : !isClickSend
                                          ? Text("发送验证码".tr)
                                          : Text("发送中".tr),
                                ),
                                // helperText: '用户名',
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              ),
                              validator: (v) {
                                return v!.trim().isNotEmpty ? null : "验证码不能为空".tr;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    if ((_formKey.currentState as FormState)
                                        .validate()) {
                                      register();
                                    }
                                  },
                                  label: Text("注册".tr),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          const Size(double.infinity, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                )),
                          ]),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }

  //发送验证码
  Future<void> sendCode(String email) async {
    setState(() {
      isClickSend = true;
    });
    try {
      dios.Dio dio = dios.Dio();
      dios.FormData formData = dios.FormData.fromMap({
        "email": email,
      });
      dios.Response response = await dio
          .post("https://www.jzhangluo.com/v1/send_code", data: formData);
      String resultMsg = response.data['msg'];
      if (response.data['code'] == 200) {
        Toast("已发送", resultMsg);
        setState(() {
          isSendCheckNum = true;
          countTime = 120;
          startCountdown();
        });
      } else if (response.data['code'] == -1) {
        Toast("提醒".tr, resultMsg);
      } else if (response.data['code'] == -2) {
        Toast("提醒".tr, resultMsg);
      } else if (response.data['code'] == -3) {
        Toast("请规范填写邮箱", resultMsg);
      } else if (response.data['code'] == 100) {
        Toast("提醒".tr, resultMsg);
      }
    } catch (e) {
      Toast("请检查网络连接".tr, e.toString());
    } finally {
      setState(() {
        isClickSend = false;
      });
    }
  }

//注册
  Future<void> register() async {
    late String result;
    String username = _usernameController.text;
    String pass = _passwordController.text;
    String email = _emailController.text;
    String checkCode = _checkNumController.text;
    dios.Dio dio = dios.Dio();
    dios.FormData formData = dios.FormData.fromMap({
      "username": username,
      "password": pass,
      "email": email,
      "code": checkCode,
    });
    try {
      dios.Response response = await dio
          .post("https://www.jzhangluo.com/v1/register", data: formData);
      if (response.data['code'] == 200) {
        result = response.data['msg'];
        Toast(result, "5s后返回登录页");
        Future.delayed(const Duration(seconds: 5), () {
          if (Get.isSnackbarOpen) {
            Get.back();
          }
          Get.back();
        });
      } else if (response.data['code'] == 100) {
        result = response.data['msg'];
        Toast(result, "");
      } else if (response.data['code'] == -1) {
        result = response.data['msg'];
        Toast(result, "请检查后重新填写");
      } else if (response.data['code'] == -2) {
        result = response.data['msg'];
        Toast("检验验证码时发生错误", result);
      } else if (response.data['code'] == -3) {
        result = response.data['msg'];
        Toast("创建用户时发生错误", result);
      } else if (response.data['code'] == -4) {
        result = response.data['msg'];
        Toast("该用户已注册", result);
      }
    } catch (e) {
      Toast("请检查网络连接", e.toString());
    }
  }

//倒计时
  void startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countTime == 0) {
        setState(() {
          isSendCheckNum = false;
          timer.cancel();
        });
      } else {
        setState(() {
          countTime--;
        });
      }
    });
  }
}
