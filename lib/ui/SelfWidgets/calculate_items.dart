import 'package:auto_size_text/auto_size_text.dart';
import 'package:carbon_foot_print/common/EventBus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/items.dart';

class Items extends StatefulWidget {
  const Items({
    super.key,
    required this.item,
    required this.index,
  });

  final Item item;
  final int index;

  @override
  _Item createState() => _Item();
}

class _Item extends State<Items> {
  @override
  Widget build(BuildContext context) {
    Widget image = Image(
      image: AssetImage(widget.item.imagePath),
      width: 45,
      fit: BoxFit.contain,
    );
    return SizedBox(
      width: 46,
      child: InkWell(
        autofocus: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: image,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: AutoSizeText(
                widget.item.name.tr,
              ),
            ),
          ],
        ),
        onTap: () {
          eventBus.fire(SelectedItem(widget.item,widget.index));
        },
      ),
    );
  }
}
