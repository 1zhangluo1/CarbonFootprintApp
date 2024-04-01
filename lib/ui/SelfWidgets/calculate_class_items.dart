import 'package:carbon_foot_print/common/EventBus.dart';
import 'package:carbon_foot_print/gen/assets.gen.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/execute_calculate.dart';
import 'package:flutter/material.dart';
import '../../models/items.dart';
import 'calculate_items.dart';

class CalculateClass extends StatefulWidget {
  const CalculateClass({
    super.key,
    required this.contents,
  });

  final List<Items> contents;

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<CalculateClass> {
  ValueNotifier<Item> isShowItem =
      ValueNotifier<Item>(const Item("还未选择哦", "null", "null"));

  var Events;

  @override
  void initState() {
    Events = eventBus.on<SelectedItem>().listen((event) {
      isShowItem.value = event.item;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = widget.contents.map((e) => e as Widget).toList();
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 800,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            child: Wrap(
              spacing: 35,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: widgetList,
            ),
          ),
          Container(
            height: 15,
          ),
          ValueListenableBuilder<Item>(
            builder: (BuildContext context, Item value, Widget? child) {
              if (value.name == "还未选择哦") {
                return Column(
                  children: [
                    Image(
                      image: AssetImage(Assets.images.noselected.path),
                      width: 80,
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    const Text(
                      "还未选择要计算的产品哦!!!",
                      textScaleFactor: 1.5,
                    ),
                  ],
                );
              }
              // builder 方法只会在 _counter 变化时被调用
              else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Execute(item: value),
                  ],
                );
              }
            },
            valueListenable: isShowItem,
          )
        ],
      ),
    );
  }
}