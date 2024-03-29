import 'package:carbon_foot_print/common/Global.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher_string.dart';

import '../../routes/route.dart';

class Page114 extends StatefulWidget {
  const Page114({super.key});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page114> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("个人主页"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Card(
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoute.loginPage, arguments: true);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage("images/carbon.png"),
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Padding(padding: EdgeInsets.only(right: 15)),
                          //Obx( () { return const Text("登录");}),
                          Text(
                            "点击登录",
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoute.detail_profile);
                        },
                        leading: const Icon(Icons.person),
                        // Icon for "选课"
                        title: const Text("个人信息"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoute.change_password);
                        },
                        leading: const Icon(Icons.border_color),
                        // Icon for "评教"
                        title: const Text("修改密码"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.history);
                        },
                        leading: const Icon(Icons.schedule),
                        // Icon for "关于"
                        title: const Text("历史记录"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.theme_select);
                        },
                        leading: const Icon(Icons.contrast),
                        // Icon for "关于"
                        title: const Text("应用主题"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoute.language_select);
                        },
                        leading: const Icon(Icons.language),
                        // Icon for "连接校园网"
                        title: const Text("语言风格"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoute.praise_author);
                        },
                        leading: const Icon(Icons.thumb_up),
                        // Icon for "连接校园网"
                        title: const Text("给开发者点赞!"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.about_our_app);
                        },
                        leading: const Icon(Icons.info_outlined),
                        // Icon for "关于"
                        title: const Text("关于"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Get.snackbar("当前是最新版本", "");
                        },
                        leading: const Icon(Icons.info_outline),
                        // Icon for the version tile
                        title: Text("版本: ${Global.versionCode}"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                            onPressed: () {},
                            child: const Text(
                              "退出登录",
                              textScaleFactor: 1.3,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text.rich(
                            TextSpan(children: [
                              const TextSpan(
                                  text:
                                      "一个使用 Flutter 开发的 碳足迹计算器，此项目正在开发中，更多信息请关注 "),
                              TextSpan(
                                  text:
                                      "https://github.com/1zhangluo1/CarbonFootprintApp",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launcher.launchUrl(
                                          Uri.parse(
                                              "https://github.com/1zhangluo1/CarbonFootprintApp"),
                                          mode: LaunchMode.externalApplication);
                                    })
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
