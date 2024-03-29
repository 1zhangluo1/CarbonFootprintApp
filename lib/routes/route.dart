import 'package:carbon_foot_print/ui/home.dart';
import 'package:carbon_foot_print/ui/login/login.dart';
import 'package:carbon_foot_print/ui/login/register.dart';
import 'package:carbon_foot_print/ui/profile_page_items/change_password.dart';
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
  static const String detail_profile = "/detail_profile";
  static const String change_password = "/change_password";
  static const String history = "/history";
  static const String theme_select = "/theme_select";
  static const String language_select = "/language_select";
  static const String praise_author = "/praise_author";
  static const String about_our_app = "/about_our_app";

  static List<GetPage> routes = [
    GetPage(
        name: loginPage,
        page: () => const LoginPage(enterAfterSuccess: true),
        transition: Transition.cupertino),
    GetPage(
        name: registerPage,
        page: () => const Register(),
        transition: Transition.cupertino),
    GetPage(
        name: homePage,
        page: () => const MainStruct(),
        transition: Transition.cupertino),
    GetPage(
        name: detail_profile,
        page: () => const Profile(),
        transition: Transition.cupertino),
    GetPage(
        name: change_password,
        page: () => const ChangePass(),
        transition: Transition.cupertino),
    GetPage(
        name: history,
        page: () => const History(),
        transition: Transition.cupertino),
    GetPage(
        name: theme_select,
        page: () => const ThemeSelect(),
        transition: Transition.cupertino),
    GetPage(
        name: language_select,
        page: () => const Language(),
        transition: Transition.cupertino),
    GetPage(
        name: praise_author,
        page: () => const Praise(text: "张洛"),
        transition: Transition.cupertino),
    GetPage(
        name: about_our_app,
        page: () => const Information(),
        transition: Transition.cupertino),
  ];
}
