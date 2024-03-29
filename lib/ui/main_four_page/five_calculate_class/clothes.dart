import 'package:flutter/cupertino.dart';

import '../../SelfWidgets/calculate_items.dart';

class Clothes extends StatelessWidget {
  const Clothes ({
    super.key,
    required this.contents,
});

  final List<Items>? contents;

  @override
  Widget build (BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 150,
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        alignment: WrapAlignment.start,
        children: [
        ],
      ),
    );
  }

}