import 'package:carbon_foot_print/common/Global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatefulWidget {
  const Language({
    super.key,
  });

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Language> {
  
  RxInt selectId = 1.obs;

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
          title: Text("语言选择".tr),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: SingleChildScrollView(child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {
                  changeId(Locale('zh','CN'), 1);
                },
                leading: Image(image: AssetImage(Assets.images.chinese.path),fit: BoxFit.contain,width: 45,),
                title: const Text(
                  "中文",
                  textScaleFactor: 1.2,
                ),
                trailing: selectId == 1 ? const Icon(Icons.check) : null,
              ),
              ListTile(
                onTap: () {
                  changeId(Locale('en','US'), 2);
                },
                leading: Image(image: AssetImage(Assets.images.us.path),fit: BoxFit.contain,width: 45,),
                title: const Text(
                  "英语",
                  textScaleFactor: 1.2,
                ),
                trailing: selectId == 2 ? const Icon(Icons.check) : null,
              ),
            ],
          );
        })));
  }

  void changeId(Locale locale, int id) async {
    Get.updateLocale(locale);
    selectId.value = id;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('language', id);
  }
  
  void getId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    selectId.value = pref.getInt('language') ?? 1;
  }
}
