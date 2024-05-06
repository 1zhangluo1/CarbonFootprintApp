import 'package:carbon_foot_print/models/items.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/DashLine.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/execute_calculate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../common/EventBus.dart';
import '../../gen/assets.gen.dart';
import 'calculate_items.dart';

class CalculateClass extends StatefulWidget {
  const CalculateClass({
    super.key,
    required this.contents,
    required this.index,
  });

  final List<Items> contents;
  final int index;

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<CalculateClass>
    with AutomaticKeepAliveClientMixin {
  final Rx<Item> item = Item('', '', '', '',(p0) => null).obs;
  RxInt check_index = 20.obs;

  var Events;

  @override
  void initState() {
    Events = eventBus.on<SelectedItem>().listen((event) {
      item.value = event.item;
      check_index.value = event.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    super.build(context);
    List<Widget> widgetList = widget.contents.map((e) => e as Widget).toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Wrap(
              spacing: 35,
              runSpacing: 15,
              alignment: WrapAlignment.start,
              children: widgetList,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: LDashedLine(
                    axis: Axis.horizontal,
                    dashedTotalLengthWith: width / 2 - 20,
                    dashedWidth: 10,
                  )),
              Text('End'),
              Align(
                  alignment: Alignment.centerRight,
                  child: LDashedLine(
                    axis: Axis.horizontal,
                    dashedTotalLengthWith: width / 2 - 20,
                    dashedWidth: 10,
                  )),
            ],
          ),
          Obx(() {
            return check_index == widget.index
                ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Execute(
                      item: item.value,
                    ),
                )
                : Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
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
                      ),
                    ),
                  );
          }),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
