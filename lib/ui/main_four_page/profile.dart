import 'package:flutter/cupertino.dart';

class Page114 extends StatefulWidget {
  const Page114({
    super.key,
    required this.text
  });

  final String text;

  @override
  _PageState createState() => _PageState();

}

class _PageState extends State<Page114> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }
}