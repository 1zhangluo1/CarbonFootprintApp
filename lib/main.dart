import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/internation/Internet.dart';
import 'package:carbon_foot_print/routes/route.dart';
import 'package:carbon_foot_print/ui/Ad/Ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GetMaterialApp(
      title: '碳足迹计算器',
      home: Ad(),
      darkTheme: ThemeData.dark(),
      // 默认夜间模式主题
      themeMode: ThemeMode.system,
      // 根据系统设置选择日间模式或夜间模式
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Global.themeColor,
        ),
      ),
      translations: Internet(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      navigatorKey: AppRoute.navigatorKey,
      getPages: AppRoute.routes,
    );
  }
}
