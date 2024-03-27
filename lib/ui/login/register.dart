import 'package:flutter/cupertino.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
  });


  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("注册", textScaleFactor: 5));
  }
}