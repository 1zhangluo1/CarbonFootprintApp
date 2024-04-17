import 'package:carbon_foot_print/common/EventBus.dart';
import 'package:carbon_foot_print/gen/assets.gen.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/calculate_class_items.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/calculate_items.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/execute_calculate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/items.dart';

class Page111 extends StatefulWidget {
  const Page111({super.key, required this.text});

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page111> {
  final List tabs = ['衣', '食', '住', '行', '用'];

  final item1 = Item("涤纶织物", Assets.images.clothing.path, "千克");

  final List<Items> clothes = [
    Items(
      item: Item("涤纶织物", Assets.images.clothing.path, "千克"),
    ),
    Items(
      item: Item("纯棉T恤", Assets.images.tee.path, "件"),
    ),
    Items(
      item: Item("洗衣液", Assets.images.shampoo.path, "升"),
    ),
  ];
  final List<Items> food = [
    Items(
      item: Item("白酒", Assets.images.alcohol.path, "千克"),
    ),
    Items(
      item: Item("啤酒", Assets.images.beer.path, "瓶"),
    ),
    Items(
      item: Item("吸烟", Assets.images.smoke.path, "包"),
    ),
    Items(
      item: Item("羊肉", Assets.images.meet.path, "千克"),
    ),
    Items(
      item: Item("牛肉", Assets.images.beef.path, "千克"),
    ),
    Items(
      item: Item("猪肉", Assets.images.fatmeat.path, "千克"),
    ),
    Items(
      item: Item("炸鸡", Assets.images.chicken.path, "千克"),
    ),
    Items(
      item: Item("鸡蛋", Assets.images.egg.path, "千克"),
    ),
    Items(
      item: Item("土豆", Assets.images.potato.path, "千克"),
    ),
    Items(
      item: Item("米饭", Assets.images.rice.path, "千克"),
    ),
    Items(
      item: Item("花生", Assets.images.peanut.path, "千克"),
    ),
    Items(
      item: Item("酸奶", Assets.images.milk.path, "千克"),
    ),
    Items(
      item: Item("西兰花", Assets.images.cauliflower.path, "千克"),
    ),
    Items(
      item: Item("豆腐", Assets.images.tofu.path, "千克"),
    ),
    Items(
      item: Item("牛奶", Assets.images.milke.path, "升"),
    ),
    Items(
      item: Item("西红柿", Assets.images.tomato.path, "千克"),
    ),
    Items(
      item: Item("扁豆", Assets.images.beans.path, "千克"),
    ),
  ];
  final List<Items> live = [
    Items(
      item: Item("煤", Assets.images.coal.path, "吨"),
    ),
    Items(
      item: Item("用电", Assets.images.lamp.path, "度"),
    ),
    Items(
      item: Item("用水", Assets.images.water.path, "立方米"),
    ),
    Items(
      item: Item("煤气", Assets.images.gas.path, "立方米"),
    ),
    Items(
      item: Item("天然气", Assets.images.naturalgas.path, "立方米"),
    ),
    Items(
      item: Item("供暖", Assets.images.heating.path, "平米/天"),
    ),
    Items(
      item: Item("蜂窝煤", Assets.images.honeycomb.path, "块"),
    ),
    Items(
      item: Item("液化气", Assets.images.liquid.path, "立方米"),
    ),
  ];
  final List<Items> traffic = [
    Items(
      item: Item("飞机", Assets.images.air.path, "公里"),
    ),
    Items(
      item: Item("火车", Assets.images.train.path, "公里"),
    ),
    Items(
      item: Item("轮船", Assets.images.ship.path, "公里"),
    ),
    Items(
      item: Item("地铁", Assets.images.subway.path, "公里"),
    ),
    Items(
      item: Item("公交车", Assets.images.bus.path, "公里"),
    ),
    Items(
      item: Item("高耗油汽车", Assets.images.car.path, "公里"),
    ),
    Items(
      item: Item("中耗油汽车", Assets.images.mediumcar.path, "公里"),
    ),
    Items(
      item: Item("低耗油汽车", Assets.images.lowcar.path, "公里"),
    ),
  ];
  final List<Items> lifeConsume = [
    Items(
      item: Item("纸制品", Assets.images.coffee.path, "千克"),
    ),
    Items(
      item: Item("塑料袋", Assets.images.plastic.path, "个"),
    ),
    Items(
      item: Item("一次性筷子", Assets.images.chopsticks.path, "双"),
    ),
    Items(
      item: Item("洗发水", Assets.images.sham.path, "瓶"),
    ),
    Items(
      item: Item("玫瑰", Assets.images.rose.path, "指"),
    ),
    Items(
      item: Item("城市垃圾", Assets.images.building.path, "千克"),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Text(widget.text),
              toolbarHeight: 40,
              bottom: TabBar(
                tabs: tabs
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList(),
              ),
            ),
            body: SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 600,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            CalculateClass(contents: clothes),
                            CalculateClass(contents: food),
                            CalculateClass(contents: live),
                            CalculateClass(contents: traffic),
                            CalculateClass(contents: lifeConsume),
                          ],
                        ),
                      )),
                ],
              ),
            )
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
