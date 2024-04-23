import 'dart:convert';
import 'package:carbon_foot_print/models/Record.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language extends StatefulWidget {
  const Language({
    super.key,
  });

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('en', 'US'));
              },
              child: Text("翻译1")),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('en', 'CH'));
              },
              child: Text("翻译2")),
        ],
      ),
    );
  }
}
