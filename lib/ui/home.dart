import 'package:carbon_foot_print/ui/main_four_page/ai_chat.dart';
import 'package:carbon_foot_print/ui/main_four_page/analyze_chart.dart';
import 'package:carbon_foot_print/ui/main_four_page/calculate.dart';
import 'package:carbon_foot_print/ui/main_four_page/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainStruct extends StatefulWidget {
  const MainStruct({super.key});

  @override
  State<MainStruct> createState() => _MainStruct();
}

class _MainStruct extends State<MainStruct> {
  int selected = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          controller: pageController,
          children: const [
            Calculate(),
            AiChat(),
            Analyze(),
            Page114()
          ],
        ),
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.calculate_outlined),
                label: "计算".tr,
                tooltip: "计算".tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.chat_outlined),
                label: "C知道".tr,
                tooltip: "AI".tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.query_stats),
                label: "分析".tr,
                tooltip: "分析报告".tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outlined),
                label: "我的".tr,
                tooltip: "我的".tr,
              ),
            ],
            onTap: (index) {
              pageController.jumpToPage(index);
            },
            currentIndex: selected,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}
