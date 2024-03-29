import 'dart:async';

import 'package:carbon_foot_print/routes/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.enterAfterSuccess});

  final bool enterAfterSuccess;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
  TextEditingController(text: "");
  final TextEditingController _passwordController =
  TextEditingController(text: "");
  FocusScopeNode? focusScopeNode;
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool isRememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0,
              ),
              child: Column(
                children: [
                  Image.asset(
                    "images/logo.jpg",
                    height: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Text("碳足迹",
                              style: TextStyle(
                                fontFamily: "logoIcon",
                                fontSize: 60.0,
                                color: Colors.green,
                              )),
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: "用户名",
                            hintText: "输入您的邮箱",
                            prefixIcon: Icon(Icons.person),
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
                          height: 16,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            labelText: "密码",
                            hintText: "您的登录密码",
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
                            return v!.trim().isNotEmpty ? null : "密码不能为空";
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Checkbox(
                                  value: isRememberPassword,
                                  activeColor: Colors.green,
                                  //选中时的颜色
                                  onChanged: (value) {
                                    setState(() {
                                      isRememberPassword = value!;
                                    });
                                  },
                                ),
                              ),
                              const Text("记住密码"),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                  rememberPassword();
                                }
                              },
                              label: const Text("登录"),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoute.registerPage,arguments: true);
                              },
                              label: const Text("注册"),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            )),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
    )
    );
  }

  @override
  void initState() {
    super.initState();
    print(isRememberPassword);
    initLoginInformation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isShowCodeEditor = false;

  Future<void> rememberPassword() async {
    print(isRememberPassword);
    if (isRememberPassword) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("account", _usernameController.text);
      await prefs.setString("password", _passwordController.text);
      await prefs.setBool("isRemember", isRememberPassword);
    } else if (!isRememberPassword) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isRemember", isRememberPassword);
    }
  }

  Future<void> initLoginInformation() async {
    final prefs = await SharedPreferences.getInstance();
    final isRemember = prefs.getBool("isRemember") ?? false;
    if (isRemember) {
      _usernameController.text = prefs.getString("account")!;
      _passwordController.text = prefs.getString("password")!;
    } else {
      return;
    }
  }
}
