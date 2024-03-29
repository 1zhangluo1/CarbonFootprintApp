import 'package:carbon_foot_print/ui/SelfWidgets/calculate_items.dart';
import 'package:flutter/material.dart';

class Page111 extends StatefulWidget {
  const Page111({super.key, required this.text});

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page111> {
  List tabs = ['衣', '食', '住', '行', '用'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Theme(
            data: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightGreenAccent,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 10,
                bottom: TabBar(
                  tabs: tabs
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList(),
                ),
              ),
              body: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: double.infinity,
                  ),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Items(imagePath: 'images/clothing.png', itemName: '涤纶织物'),
                    ],
                  )),
            )));
  }
}
