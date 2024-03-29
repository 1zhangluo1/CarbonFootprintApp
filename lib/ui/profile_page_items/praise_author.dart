import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Praise extends StatefulWidget {
  const Praise({
    super.key,
    required this.text
  });

  final String text;

  @override
  _PageState createState() => _PageState();

}

class _PageState extends State<Praise> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("222", textScaleFactor: 5)),
    );
  }
}