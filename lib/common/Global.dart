import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {

  //版本号
  static String versionCode = "1.1.0";

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //登录状态
  bool isLogin = false;

  static Color themeColor = Colors.green;

  // //初始化全局信息，会在APP启动时执行
  // static Future init() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   _prefs = await SharedPreferences.getInstance();
  //   var _profile = _prefs.getString("profile");
  //   if (_profile != null) {
  //     try {
  //       profile = Profile.fromJson(jsonDecode(_profile));
  //     } catch (e) {
  //       print(e);
  //     }
  //   }else{
  //     // 默认主题索引为0，代表蓝色
  //     profile= Profile()..theme=0;
  //   }
  //
  //   // 如果没有缓存策略，设置默认缓存策略
  //   profile.cache = profile.cache ?? CacheConfig()
  //     ..enable = true
  //     ..maxAge = 3600
  //     ..maxCount = 100;
  //
  //   //初始化网络请求相关配置
  //   Git.init();
  // }
  //
  // // 持久化Profile信息
  // static saveProfile() =>
  //     _prefs.setString("profile", jsonEncode(profile.toJson()));

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    int colorId = prefs.getInt("themeId") ?? 0;
    Global.themeColor = getColorById(colorId);
    print(themeColor.toString());
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

}