import 'package:carbon_foot_print/ui/home.dart';
import 'package:carbon_foot_print/ui/login/login.dart';
import 'package:carbon_foot_print/ui/login/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static const String loginPage = "/loginPage";
  static const String registerPage = "/registerPage";
  static const String homePage = "/";

  static List<GetPage> routes = [
    GetPage(
      name: loginPage,
      page: () => const LoginPage(enterAfterSuccess: true),
    ),
    GetPage(
      name: registerPage,
      page: () => const Register(),
    ),
    GetPage(
      name: homePage,
      page: () => const MainStruct(),
    )
  ];
}