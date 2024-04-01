import 'package:carbon_foot_print/models/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Execute extends StatefulWidget {
  const Execute({super.key, required this.item});

  final Item item;

  @override
  _ExcuteState createState() => _ExcuteState();
}

class _ExcuteState extends State<Execute> {
  final TextEditingController number = TextEditingController(text: "");
  GlobalKey format = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  textScaleFactor: 1.5,
                ),
                const Padding(padding: EdgeInsets.only(right: 15)),
                SizedBox(
                  width: 170,
                  height: 55,
                  child: Form(
                    key: format,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: number,
                      autofocus: false,
                      decoration: const InputDecoration(
                          hintText: "数量",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                      validator: (v) {
                        return v!.trim().isNotEmpty ? null : "数量不能为空";
                      },
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 15)),
                Text(
                  widget.item.type,
                  textScaleFactor: 1.5,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    if ((format.currentState as FormState).validate()) {
                      print(number.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 62, 180, 62),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    "计算",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
