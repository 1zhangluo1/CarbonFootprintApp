import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSelect extends StatefulWidget {
  const ThemeSelect({
    super.key,
  });

  @override
  _ThemeState createState() => _ThemeState();
}

class _ThemeState extends State<ThemeSelect> {

  int selectId = 0;

  @override
  void initState() {
    getId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("主题选择"),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                changeColor(Colors.green,0);
                saveId(0);
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle),
              ),
              title: const Text("绿色",textScaleFactor: 1.2,),
              trailing: selectId == 0 ? const Icon(Icons.check) : null,
            ),
            ListTile(
              onTap: () {
                changeColor(Colors.blue,1);
                saveId(1);
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle),
              ),
              title: const Text("蓝色",textScaleFactor: 1.2,),
              trailing: selectId == 1 ? const Icon(Icons.check) : null,
            ),
            ListTile(
              onTap: () {
                changeColor(Colors.orange,2);
                saveId(2);
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle),
              ),
              title: const Text("橙色",textScaleFactor: 1.2,),
              trailing: selectId == 2 ? const Icon(Icons.check) : null,
            ),
            ListTile(
              onTap: () {
                changeColor(Colors.tealAccent,3);
                saveId(3);
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    color: Colors.tealAccent,
                    shape: BoxShape.circle),
              ),
              title: const Text("淡青色",textScaleFactor: 1.2,),
              trailing: selectId == 3 ? const Icon(Icons.check) : null,
            ),
            ListTile(
              onTap: () {
                changeColor(Colors.red,4);
                saveId(4);
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle),
              ),
              title: const Text("红色",textScaleFactor: 1.2,),
              trailing: selectId == 4 ? const Icon(Icons.check) : null,
            ),
            ListTile(
              onTap: () {
                changeColor(Colors.yellow,5);
                saveId(5);
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle),
              ),
              title: const Text("黄色",textScaleFactor: 1.2,),
              trailing: selectId == 5 ? const Icon(Icons.check) : null,
            ),
            ListTile(
              onTap: () {
                changeColor(Colors.purple,6);
                saveId(6);
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle),
              ),
              title: const Text("紫色",textScaleFactor: 1.2,),
              trailing: selectId == 6 ? const Icon(Icons.check) : null,
            ),
            ListTile(
              onTap: () {
                Get.changeTheme(ThemeData.dark());
                setState(() {
                  selectId = 7;
                });
                saveId(7);
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle),
              ),
              title: const Text("夜间模式",textScaleFactor: 1.2,),
              trailing: selectId == 7 ? const Icon(Icons.check) : null,
            ),
          ],
        )));
  }

  void changeColor(Color color , int id) {
    Get.changeTheme(ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: color,
      ),
    ));
    setState(() {
      selectId = id;
    });
  }

  Future<void> saveId(int id, ) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("themeId", id);
  }

  Future<void> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final themeId = prefs.getInt("themeId") ?? 0;
    setState(() {
      selectId = themeId;
    });
  }

}
