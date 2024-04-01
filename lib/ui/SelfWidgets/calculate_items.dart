import 'package:carbon_foot_print/common/EventBus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/items.dart';

class Items extends StatefulWidget {
  const Items({
    super.key,
    required this.item,
  });

  final Item item;

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
    return InkWell(
      autofocus: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: image,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              widget.item.name,
              textScaleFactor: 1.2,
            ),
          ),
        ],
      ),
      onTap: () {
        eventBus.fire(SelectedItem(widget.item));
      },
    );
  }
}
