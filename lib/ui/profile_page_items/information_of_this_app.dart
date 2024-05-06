import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Information extends StatefulWidget {
  const Information({super.key,});

  @override
  _PageState createState() => _PageState();

}

class _PageState extends State<Information> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('关于'.tr),),
      body: Center(
        child: Text('关于软件和碳足迹'),
      ),
    );
  }
}