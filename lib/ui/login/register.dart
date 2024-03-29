import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("注册新账户"),
        ),
        backgroundColor: Colors.white,
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
                              decoration: const InputDecoration(
                                labelText: "昵称",
                                hintText: "输入您的昵称",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                              ),
                              validator: (v) {
                                return v!.trim().isNotEmpty ? null : "昵称不能为空";
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: "邮箱",
                                hintText: "您的邮箱",
                                prefixIcon: Icon(Icons.email_outlined),
                                // helperText: '用户名',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              ),
                              validator: (v) {
                                return v!.trim().isNotEmpty ? null : "账号不能为空";
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: "密码",
                                hintText: "密码长度需大于6位数",
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
                                return v!.trim().length > 6 ? null : "密码不能为空";
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _checkNumController,
                              decoration: InputDecoration(
                                labelText: "验证码",
                                hintText: "输入您的验证码",
                                prefixIcon: const Icon(Icons.person),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_emailController.text.isEmpty) {
                                        Get.snackbar("请先填写邮箱", "");
                                      }
                                      else if (!isSendCheckNum &&
                                      _passwordController.text.length >= 6 &&
                                      _emailController.text.isNotEmpty) {
                                      isSendCheckNum = !isSendCheckNum;
                                      Get.snackbar("已发送", "");
                                      }
                                      else if (isSendCheckNum) {
                                        Get.snackbar("已发送验证码,请勿重复点击", "");
                                      }
                                    });
                                  },
                                  icon: isSendCheckNum
                                      ? const Text("已发送")
                                      : const Text("发送验证码"),
                                ),
                                // helperText: '用户名',
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              ),
                              validator: (v) {
                                return v!.trim().isNotEmpty ? null : "验证码不能为空";
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: const Text("注册"),
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

  void sendNum() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.trim().length > 6) {}
  }
}
