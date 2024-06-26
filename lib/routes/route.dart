import 'package:carbon_foot_print/Utils/CloseKeyBoard.dart';
import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/ui/Ad/Ad.dart';
import 'package:carbon_foot_print/ui/home.dart';
import 'package:carbon_foot_print/ui/login/login.dart';
import 'package:carbon_foot_print/ui/login/register.dart';
import 'package:carbon_foot_print/ui/profile_page_items/detaill_profile.dart';
import 'package:carbon_foot_print/ui/profile_page_items/history_result.dart';
import 'package:carbon_foot_print/ui/profile_page_items/information_of_this_app.dart';
import 'package:carbon_foot_print/ui/profile_page_items/language_select.dart';
import 'package:carbon_foot_print/ui/profile_page_items/praise_author.dart';
import 'package:carbon_foot_print/ui/profile_page_items/theme_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String loginPage = "/loginPage";
  static const String registerPage = "/registerPage";
  static const String homePage = "/";
  static const String history = "/history";
  static const String theme_select = "/theme_select";
  static const String language_select = "/language_select";
  static const String praise_author = "/praise_author";
  static const String about_our_app = "/about_our_app";
  static const String ad = '/ad';

  static List<GetPage> routes = [
    GetPage(
        name: loginPage,
        page: () => const LoginPage(),
        binding: DetailBinding(focusNode: Global.focusNode_ai),
        transition: Transition.cupertino),
    GetPage(
        name: registerPage,
        page: () => const Register(),
        binding: DetailBinding(focusNode: Global.focusNode_ai),
        transition: Transition.cupertino),
    GetPage(
        name: homePage,
        page: () => const MainStruct(),
        transition: Transition.cupertino),
    GetPage(
        name: history,
        page: () => const History(),
        binding: DetailBinding(focusNode: Global.focusNode_ai),
        transition: Transition.cupertino),
    GetPage(
        name: theme_select,
        page: () => const ThemeSelect(),
        binding: DetailBinding(focusNode: Global.focusNode_ai),
        transition: Transition.cupertino),
    GetPage(
        name: language_select,
        page: () => const Language(),
        binding: DetailBinding(focusNode: Global.focusNode_ai),
        transition: Transition.cupertino),
    GetPage(
        name: praise_author,
        page: () => const Praise(text: "张洛"),
        binding: DetailBinding(focusNode: Global.focusNode_ai),
        transition: Transition.cupertino),
    GetPage(
        name: about_our_app,
        page: () => const Information(),
        binding: DetailBinding(focusNode: Global.focusNode_ai),
        transition: Transition.cupertino),
    GetPage(
        name: ad,
        page: () => const Ad(),
        binding: DetailBinding(focusNode: Global.focusNode_ai),
        transition: Transition.cupertino),
  ];
}
