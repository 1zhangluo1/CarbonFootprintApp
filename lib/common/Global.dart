import 'dart:ui';

import 'package:carbon_foot_print/models/User.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/Toast.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  //版本号
  static String versionCode = "1.1.0";

  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  static final List<Color> coolColors = [
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.tealAccent,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.lightBlueAccent,
  ];
  static final List<Color> warmColors = [
    Colors.redAccent,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.pink,
    Colors.red,
    Colors.deepOrange,
    Colors.orangeAccent,
    Colors.deepOrangeAccent,
    Colors.amberAccent,
  ];

  //登录状态
  static RxBool isLogin = false.obs;

  static Color themeColor = Colors.green;

  static Locale defaultLocale = Locale('zh','CN');

  static Rx<User> profile = User(0, "", "").obs;

  static FocusNode focusNode_ai = FocusNode();

  static FocusNode focusNode_cal = FocusNode();

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    int colorId = prefs.getInt("themeId") ?? 0;
    int languageId = prefs.getInt('language') ?? 1;
    if (colorId != 7)
      Global.themeColor = getColorById(colorId);
    else if (colorId == 7) {
      Get.changeTheme(ThemeData.dark());
    }
    Global.defaultLocale = getLanguageType(languageId);
    Get.updateLocale(defaultLocale);
    isLogin.value = prefs.getBool("isLogin") ?? false;
    String token = prefs.getString("token") ?? "";
    if (token != "") {
      InitUser(token, prefs);
    }
  }

  static Color getColorById(int id) {
    switch (id) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.tealAccent;
      case 4:
        return Colors.red;
      case 5:
        return Colors.yellow;
      case 6:
        return Colors.purple;
    }
    return Colors.green;
  }

  static Locale getLanguageType(int id) {
    switch (id) {
      case 1:
        return Locale('zh','CN');
      case 2:
        return Locale('en','US');
    }
    return Locale('zh','CN');
  }

  static Future<void> InitUser(String token, SharedPreferences pref) async {
    try {
      dio.Dio dios = dio.Dio();
      dios.options.headers = {
        'token': token,
      };
      dio.Response response =
          await dios.get('https://carbon.jzhangluo.com/v1/user_info');
      if (response.data['code'] == 200) {
        Global.profile.value = User(response.data['msg']['uid'],
            response.data['msg']['username'], response.data['msg']['email']);
      } else {
        Toast("登录已过期", response.data['msg']);
        pref = await SharedPreferences.getInstance();
        pref.setBool("isLogin", false);
        isLogin.value = false;
      }
    } on Exception catch (e) {
      Global.isLogin.value = false;
      Toast("请检查网络连接", e.toString());
    }
  }
}
