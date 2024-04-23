import 'dart:async';
import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/models/User.dart';
import 'package:carbon_foot_print/routes/route.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/Toast.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carbon_foot_print/gen/assets.gen.dart';

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
  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
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
                  Assets.images.cLogo.path,
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
                                activeColor: Theme.of(context).primaryColor,
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
                                executeLogin(_usernameController.text,
                                    _passwordController.text, context);
                                rememberPassword();
                              }
                            },
                            label: Text("登录".tr),
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  AppRoute.registerPage,
                                  arguments: true);
                            },
                            label: Text("注册".tr),
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initLoginInformation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isShowCodeEditor = false;

  Future<void> rememberPassword() async {
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

  Future<void> executeLogin(
      String account, String password, BuildContext context) async {
    Get.dialog(
      result,
      useSafeArea: false,
      barrierDismissible: false,
    );
    try {
      dio.Dio dios = dio.Dio();
      dio.FormData formData = dio.FormData.fromMap({
        'email': account,
        'password': password,
      });
      dio.Response response =
          await dios.post('https://www.jzhangluo.com/v1/login', data: formData);
      if (response.data['code'] == 200) {
        initUser(response.data['token']);
        final snackBar = SnackBar(
          content: Text('登录成功,返回主页'.tr),
          duration: const Duration(seconds: 1),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pop();
        Get.back();
      } else {
        Navigator.of(context).pop();
        Toast(response.data['msg'], "请检查输入后，重新尝试");
      }
    } on Exception catch (e) {
      Toast('请检查网络连接', e.toString());
      Navigator.of(context).pop();
    }
  }

  Future<void> initUser(String token) async {
    try {
      dio.Dio dios = dio.Dio();
      dios.options.headers = {
        'token': token,
      };
      dio.Response response =
          await dios.get('https://www.jzhangluo.com/v1/user_info');
      if (response.data['code'] == 200) {
        Global.profile.value = User(response.data['msg']['uid'],
            response.data['msg']['username'], response.data['msg']['email']);
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("token", token);
        await pref.setBool("isLogin", true);
        Global.isLogin.value = true;
      }
    } on Exception catch (e) {
      Toast("NetWork ERROR:", e.toString());
    }
  }

  AlertDialog result = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    content: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        Padding(padding: EdgeInsets.only(right: 25)),
        Text("登录中...".tr),
      ],
    ),
  );
}
