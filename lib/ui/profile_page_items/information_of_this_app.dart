import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  const Information({
    super.key,
  });

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('关于'.tr),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                    '开发团队',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 5,
                      decorationColor: Theme
                          .of(context)
                          .primaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '组长：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '张洛\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '任务：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '负责移动端的开发和后端数据交互处理',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                        ])),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '组员1：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '薛佳钰\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '任务：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'web前端，javascript做动态元素控制，以及各种请求脚本',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                        ])),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '组员2：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '钟国梁\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '任务：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'web前端，三件套(html,css,javascript)统筹设计开发',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                        ])),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '组员3：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '徐鸿博\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '任务：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'web前端，使用css做出一些动画和元素',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                        ])),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '组员4：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '谢佳珂\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '任务：',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '攥写实验报告，制作碳足迹宣传手册，使用html制作web架构',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                        ])),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                  child: Text(
                    '软件介绍',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 5,
                        decorationColor: Theme
                            .of(context)
                            .primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  )),
               Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('一.软件背景', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22,),),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        '  中国是世界上最大的碳排放国家之一，其碳足迹发展现状在过去几年有所改善，但仍然面临挑战。在这样的情况下，一款用来计算常见产品的碳排放，让用户了解该产品的碳排放量，并且能将用户的碳排放记录下来，并将其可视化的软件，正是双碳行动中所需要的，我们的碳足迹计算器也应运而生',
                        style: TextStyle(fontSize: 18,),),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text('二.软件用途', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22,),),
                      const SizedBox(height: 15,),
                      const Text(
                        '  我们的产品计算界面采用了单个产品单次计算的方式，这样有助于用户不仅能了解每个产品的碳排放的同时，也能够把自己对应的碳排放行为记录下来，有了碳排放的记录，或许还不够，所以我们还有可视化图表来形象展现用户产生的数据，用户能够更加精准地知道自己的碳排放情况，便于日后在生活中做出相应的改变，来减少碳排放，保护环境！！！\ntips：如果用户不知道怎样才能减少碳排放，我们还有ai问答的窗口可供用户使用哦，借助人工智能能的力量来助力用户达成保护环境的目的',
                        style: TextStyle(fontSize: 18,),),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text('三.软件功能', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22,),),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 1.碳足迹计算：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '将产品分为衣、食、住、行、用五个方面，在其中找到自己想要了解或者记录的产品，输入使用量，再点击计算便可以算出对应的碳排放啦。',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 2.AI问答功能：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '用户对于碳足迹，碳中和，保护环境方面的知识有想要了解的话，可以通过此入口来与AI进行对话，AI会尽其所能地为您解决疑惑',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 3.可视化图表：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '饼图可以将用户使用的衣、食、住、行、用这五种方面排放的碳来按比例绘制饼图，让用户清晰直观地看到自己五个方面的碳排放占比情况\n柱状图将用户使用的单个产品的碳排放做出统计，筛选出排放量前五的产品，让用户一眼便了解自己排放碳最多的产品\n折线图将用户过去七天的碳排放以折线的形式呈现，让用户清晰地了解到自己最近的碳排放情况，能及时做出调整策略',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 4.登录注册：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '登录注册实现用户数据独立，注册的验证码功能防止恶意注册，占用资源',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 5.修改密码：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '用户发现密码泄露风险时候可以修改密码来确保账户安全',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 6.历史记录：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '用户可以查询自己保存过的碳排放记录，在此界面查看，并且对于排放过多的记录，会议红色标出作警示用途',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 7.主题更换：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(text: '用户可以更换主题颜色，让软件的风格多变',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 8.语言切换：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '用户可以根据自己习惯来选择语言（注意：仅支持应用内文字，ai问答和软件介绍没有适配此功能）',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 9.版本查看：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(text: '用户能在主页轻松看到版本信息',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(text: ' 10.退出账户：',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(text: '用户能够退出当前账户以登录其他账户',
                            style: TextStyle(fontSize: 18,)),
                      ])),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text('四.配套网站', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22,),),
                      const SizedBox(
                        height: 15,
                      ),
                      Text.rich(TextSpan(children: [
                        const TextSpan(text: "网站地址："),
                        TextSpan(
                            text: "https://www.jzhangluo.com/主页/html+css/主页.html",
                            style: const TextStyle(fontSize: 18, color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launcher.launchUrl(
                                    Uri.parse(
                                        "https://www.jzhangluo.com/主页/html+css/主页.html"),
                                    mode: LaunchMode.externalApplication);
                              }),
                      ])),
                      const SizedBox(
                        height: 45,
                      )
                    ],
                  )
              ),
            ],
          ),
        ));
  }
}
