import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carbon_foot_print/gen/assets.gen.dart';
import 'package:get/get.dart';

class Praise extends StatefulWidget {
  const Praise({
    super.key,
    required this.text
  });

  final String text;

  @override
  _PraiseState createState() => _PraiseState();

}

class _PraiseState extends State<Praise> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("给开发者点赞".tr),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Image(
                  image: AssetImage(Assets.images.payCode.path),
                width: 300,
                height: 300,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Image(
                image: AssetImage(Assets.images.vxPay.path),
                width: 300,
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}