import 'package:flutter/cupertino.dart';

class Page112 extends StatefulWidget {
  const Page112({
    super.key,
    required this.text
  });

  final String text;

  @override
  _PageState createState() => _PageState();

}

class _PageState extends State<Page112> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }
}