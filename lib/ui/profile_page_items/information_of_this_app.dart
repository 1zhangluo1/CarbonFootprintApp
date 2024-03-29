import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({super.key,});

  @override
  _PageState createState() => _PageState();

}

class _PageState extends State<Information> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("222", textScaleFactor: 5)),
    );
  }
}