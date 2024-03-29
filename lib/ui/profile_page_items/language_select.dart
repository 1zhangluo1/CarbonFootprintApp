import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({super.key,});

  @override
  _PageState createState() => _PageState();

}

class _PageState extends State<Language> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("222", textScaleFactor: 5)),
    );
  }
}