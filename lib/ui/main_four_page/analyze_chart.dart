import 'dart:math';
import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/gen/assets.gen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echart/flutter_echart.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class Analyze extends StatefulWidget {
  const Analyze({
    super.key,
  });

  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  List<String> imagePath = [
    Assets.images.banner1.path,
    Assets.images.banner2.path,
    Assets.images.banner3.path,
    Assets.images.banner4.path,
  ];
  final List<String> dates = [
    '01/01',
    '01/02',
    '01/03',
    '01/04',
    '01/05',
    '01/06',
    '01/07'
  ];
  final List<String> data = [
    '20.2',
    '15.1',
    '2.52',
    '51',
    '4.5',
    '7.62',
    '55.23'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Color> c_colors = Global.coolColors;
    final List<Color> w_colors = Global.warmColors;
    List<Color> cold_colors = getColors(c_colors);
    // List<Color> warm_colors = getColors(w_colors);
    //final Random _random = Random();
    // List<List<Color>> all_color = [cold_colors, warm_colors];
    // List<Color> colors = all_color[_random.nextInt(2)];
    List<Color> areaColors = [Theme.of(context).primaryColor.withOpacity(0.2)];
    List<EChartPieBean> _dataList = [
      EChartPieBean(title: "生活费", number: 11, color: Colors.lightBlueAccent),
      EChartPieBean(title: "游玩费", number: 13, color: Colors.deepOrangeAccent),
      EChartPieBean(title: "交通费", number: 23, color: Colors.green),
      EChartPieBean(title: "贷款费", number: 4.2.toInt(), color: Colors.amber),
      EChartPieBean(title: "电话费", number: 0.1.toInt(), color: Colors.orange),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          image: AssetImage(imagePath[index]),
                          fit: BoxFit.fill,
                        ));
                  },
                  itemCount: 4,
                  pagination: const SwiperPagination(),
                  loop: true,
                  autoplay: true,
                  duration: 1000,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '今日耗碳占比'.tr,
                  style: const TextStyle(
                    fontSize: 20.0,
                    height: 1.0,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: SizedBox(
                  height: 200,
                  child: PieChatWidget(
                    dataList: _dataList,
                    isLog: false,
                    isLineText: true,
                    bgColor: Theme.of(context).backgroundColor,
                    isFrontgText: false,
                    initSelect: -1,
                    openType: OpenType.ANI,
                    loopType: LoopType.AUTO_LOOP,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '近日碳排放种类排行'.tr,
                  style: const TextStyle(
                    fontSize: 20.0,
                    height: 1.0,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('aaaaa'),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '近七日碳排放统计'.tr,
                  style: const TextStyle(
                    fontSize: 20.0,
                    height: 1.0,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      clipData: FlClipData.vertical(),
                      minY: 0,
                      gridData: FlGridData(
                        drawHorizontalLine: true,
                      ),
                      borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(
                              width: 2.5,
                            ),
                            left: BorderSide(
                              width: 2.5,
                            ),
                            top: BorderSide.none,
                            right: BorderSide.none,
                          )),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                            rotateAngle: 315,
                            reservedSize: 10,
                            showTitles: true,
                            getTextStyles: (value) {
                              switch (value.toInt()) {
                                case 0:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 1:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 2:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 3:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 4:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 5:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 6:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                              }
                              return TextStyle(
                                  color: Colors.black, fontSize: 15);
                            },
                            getTitles: (value) {
                              switch (value) {
                                case 0:
                                  return dates[0];
                                case 1:
                                  return dates[1];
                                case 2:
                                  return dates[2];
                                case 3:
                                  return dates[3];
                                case 4:
                                  return dates[4];
                                case 5:
                                  return dates[5];
                                case 6:
                                  return dates[6];
                                default:
                                  return '';
                              }
                            },
                            margin: 15),
                        leftTitles: SideTitles(
                            reservedSize: 15,
                            showTitles: true,
                            getTextStyles: (value) {
                              switch (value.toInt()) {
                                case 10:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 20:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 30:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 40:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 50:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                                case 60:
                                  return TextStyle(
                                      color: Colors.black, fontSize: 15);
                              }
                              return TextStyle(
                                  color: Colors.black, fontSize: 15);
                            },
                            getTitles: (value) {
                              switch (value.toInt()) {
                                case 5:
                                  return '5';
                                case 10:
                                  return '10';
                                case 15:
                                  return '15';
                                case 20:
                                  return '20';
                                case 25:
                                  return '25';
                                case 30:
                                  return '30';
                                case 35:
                                  return '35';
                                case 40:
                                  return '40';
                                case 45:
                                  return '45';
                                case 50:
                                  return '50';
                                case 55:
                                  return '55';
                                case 60:
                                  return '60';
                              }
                              return '';
                            },
                            margin: 20,
                            interval: 10),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, double.parse(data[0])),
                            FlSpot(1, double.parse(data[1])),
                            FlSpot(2, double.parse(data[2])),
                            FlSpot(3, double.parse(data[3])),
                            FlSpot(4, double.parse(data[4])),
                            FlSpot(5, double.parse(data[5])),
                            FlSpot(6, double.parse(data[6])),
                          ],
                          belowBarData: BarAreaData(
                            show: true,
                            colors: areaColors,
                          ),
                          isCurved: false,
                          colors: cold_colors,
                          barWidth: 5,
                          dotData: FlDotData(show: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> getColors(List<Color> _colors) {
    final Random _random = Random();
    List<Color> colors = [];
    while (colors.length < 5) {
      final Color color = _colors[_random.nextInt(_colors.length)];
      if (!colors.contains(color)) {
        colors.add(color);
      }
    }
    return colors;
  }
}
