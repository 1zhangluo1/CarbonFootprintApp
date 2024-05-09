import 'dart:async';
import 'dart:math';
import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/gen/assets.gen.dart';
import 'package:dio/dio.dart' as dios;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echart/flutter_echart.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart' as old;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Analyze extends StatefulWidget {
  const Analyze({
    super.key,
  });

  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  //轮播图数据
  List<String> imagePath = [
    Assets.images.banner1.path,
    Assets.images.banner2.path,
    Assets.images.banner3.path,
    Assets.images.banner4.path,
  ];

  //饼图数据
  late Map<String, num> pieData;

  late final List<EChartPieBean> _pieDataList = [
    EChartPieBean(title: '无数据', number: 1, color: Colors.white)
  ];

  //柱状图数据
  List<String> barNames = ['', '', '', '', ''];
  List<double> barData = [0, 0, 0, 0, 0];

  //折线图数据
  late Map<String, num> lineData;

  List<String> line_dates = [
    '01/01',
    '01/02',
    '01/03',
    '01/04',
    '01/05',
    '01/06',
    '01/07'
  ];

  List<String> line_data = ['1', '2', '3', '4', '5', '6', '7'];

  @override
  Widget build(BuildContext context) {
    final List<Color> c_colors = Global.coolColors;
    List<Color> cold_colors = getColors(c_colors);
    // List<Color> warm_colors = getColors(w_colors);
    //final Random _random = Random();
    // List<List<Color>> all_color = [cold_colors, warm_colors];
    // List<Color> colors = all_color[_random.nextInt(2)];
    List<Color> areaColors = [Theme
        .of(context)
        .primaryColor
        .withOpacity(0.2)
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
                  '耗碳类型占比'.tr,
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
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SizedBox(
                  height: 200,
                  child: FutureBuilder(
                      future: getPieData(),
                      initialData: _pieDataList,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return pieChart(_pieDataList);
                          }
                          return pieChart(_pieDataList);
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 10)),
                                Text("加载中...".tr),
                              ],
                            ),
                          );
                        }
                      }),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '碳排放种类排行'.tr,
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
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 250,
                  child: FutureBuilder(
                      future: getBarData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            Text('数据获取错误：' + snapshot.error.toString());
                          }
                          return barChart(barNames, barData);
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 10)),
                                Text("加载中...".tr),
                              ],
                            ),
                          );
                        }
                      }),
                ),
              ),
              const SizedBox(
                height: 60,
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  height: 250,
                  child: FutureBuilder(
                    future: getLineData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                                '加载错误：' + snapshot.error.toString()),
                          );
                        } else {
                          return LineChart(
                            LineChartData(
                              clipData: FlClipData.vertical(),
                              maxY: findMax(line_data),
                              minY: 0,
                              gridData: FlGridData(
                                drawHorizontalLine: true,
                              ),
                              borderData: FlBorderData(
                                  show: true,
                                  border: const Border(
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
                                      return const TextStyle(
                                          color: Colors.black, fontSize: 15);
                                    },
                                    getTitles: (value) {
                                      switch (value) {
                                        case 0:
                                          return line_dates[0];
                                        case 1:
                                          return line_dates[1];
                                        case 2:
                                          return line_dates[2];
                                        case 3:
                                          return line_dates[3];
                                        case 4:
                                          return line_dates[4];
                                        case 5:
                                          return line_dates[5];
                                        case 6:
                                          return line_dates[6];
                                        default:
                                          return '';
                                      }
                                    },
                                    margin: 15),
                                leftTitles: SideTitles(
                                  reservedSize: 15,
                                  showTitles: true,
                                  getTextStyles: (value) {
                                    return const TextStyle(
                                        color: Colors.black, fontSize: 15);
                                  },
                                  margin: 20,
                                  interval: findMax(line_data) > 1000 ? 200 : ((findMax(line_data) > 100) ? 50 : 10),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    FlSpot(0, double.parse(line_data[0])),
                                    FlSpot(1, double.parse(line_data[1])),
                                    FlSpot(2, double.parse(line_data[2])),
                                    FlSpot(3, double.parse(line_data[3])),
                                    FlSpot(4, double.parse(line_data[4])),
                                    FlSpot(5, double.parse(line_data[5])),
                                    FlSpot(6, double.parse(line_data[6])),
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
                          );
                        }
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(),
                              Text("加载中...".tr),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getPieData() async {
    List<Color> pieColors = [
      Colors.pinkAccent,
      Colors.lightBlueAccent,
      Colors.yellowAccent,
      Colors.purpleAccent,
      Colors.greenAccent
    ];
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("token") ?? "";
      dios.Dio dio = dios.Dio();
      dio.options.headers = {'token': token};
      dios.Response response =
      await dio.get('https://www.jzhangluo.com/v1/record?query=pie');
      if (response.data['code'] == 201) {
        Map<dynamic, dynamic> pie = response.data["msg"];
        pieData = pie.cast<String, num>();
        print(pieData);
        _pieDataList.clear();
        int i = 0;
        pieData.forEach((key, value) {
          if (value.round() > 0) {
            _pieDataList.add(EChartPieBean(
                title: transChar(key),
                number: value.round(),
                color: pieColors[i++]));
          }
        });
        if (_pieDataList.isEmpty) {
          _pieDataList.add(
              EChartPieBean(
                  title: '无数据', number: 1, color: Global.themeColor));
        }
      } else {
        throw Exception(response.data['msg']);
      }
    } on Exception catch (e) {
      old.Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.white54,
          textColor: Colors.black);
      throw Exception(e);
    }
  }

  Future<void> getBarData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("token") ?? "";
      dios.Dio dio = dios.Dio();
      dio.options.headers = {'token': token};
      dios.Response response =
      await dio.get('https://www.jzhangluo.com/v1/record?query=topFive');
      if (response.data['code'] == 202) {
        Map<dynamic, dynamic> topFive = response.data['msg'];
        Map<int, Map<String, double>> convertedMap = {};
        topFive.forEach((key, value) {
          // 将键转换为整数
          int intKey = int.tryParse(key.toString()) ?? 0;

          // 将值转换为 Map<String, double> 类型
          Map<String, double> doubleMap = {};
          (value as Map<dynamic, dynamic>).forEach((innerKey, innerValue) {
            doubleMap[innerKey.toString()] = innerValue.toDouble();
          });

          // 将转换后的键值对添加到目标 Map 中
          convertedMap[intKey] = doubleMap;
        });
        barNames.clear();
        barData.clear();
        for (int i = 1; i <= 5; i++) {
          Map<String, double>? temp = convertedMap[i];
          temp!.forEach((key, value) {
            barNames.add(key);
            barData.add(value);
          });
        }
      } else {
        throw Exception(response.data['msg']);
      }
    } on Exception catch (e) {
      old.Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.white54,
          textColor: Colors.black);
      throw Exception(e);
    }
  }

  Future<void> getLineData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("token") ?? "";
      dios.Dio dio = dios.Dio();
      dio.options.headers = {'token': token};
      dios.Response response =
      await dio.get('https://www.jzhangluo.com/v1/record?query=recent');
      if (response.data['code'] == 203) {
        Map<dynamic, dynamic> temp = response.data['msg'];
        lineData = temp.cast<String, num>();
        line_data.clear();
        line_dates.clear();
        lineData.forEach((key, value) {
          line_dates.add(transDate(key));
          line_data.add(value.toString());
        });
      } else {
        throw Exception(response.data['msg']);
      }
    } on Exception catch (e) {
      old.Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.white54,
          textColor: Colors.black);
      throw Exception(e);
    }
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

  Color getRanmdomColor(List<Color> _colors) {
    final Random _random = Random();
    final Color color = _colors[_random.nextInt(_colors.length)];
    return color;
  }

  Color getItemColor(int index) {
    List<Color> colors = getColors(Global.coolColors);
    switch (index) {
      case 0:
        return colors[0];
      case 1:
        return colors[1];
      case 2:
        return colors[2];
      case 3:
        return colors[3];
      case 4:
        return colors[4];
      default:
        return Colors.cyanAccent;
    }
  }

  Widget pieChart(List<EChartPieBean> data) {
    return PieChatWidget(
      dataList: data,
      isLog: false,
      isLineText: true,
      bgColor: Theme
          .of(context)
          .colorScheme
          .background,
      isFrontgText: false,
      initSelect: -2,
      openType: OpenType.ANI,
      loopType: LoopType.AUTO_LOOP,
    );
  }

  Widget barChart(List<String> name, List<double> data) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
              showTitles: true,
              margin: 15,
              rotateAngle: 315,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return name[0].tr;
                  case 1:
                    return name[1].tr;
                  case 2:
                    return name[2].tr;
                  case 3:
                    return name[3].tr;
                  case 4:
                    return name[4].tr;
                  default:
                    return '';
                }
              },
              getTextStyles: (value) {
                return TextStyle(color: Colors.black, fontSize: 15);
              }),
          leftTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(
                width: 2.5,
              ),
              left: BorderSide(
                width: 2.5,
              ),
              top: BorderSide.none,
              right: BorderSide.none,
            )),
        barGroups: [
          BarChartGroupData(x: 0, barsSpace: 8, barRods: [
            BarChartRodData(
                y: data[0],
                colors: [Colors.orangeAccent, Colors.redAccent],
                width: 30,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.zero, top: Radius.circular(30)))
          ]),
          BarChartGroupData(x: 1, barsSpace: 8, barRods: [
            BarChartRodData(
                y: data[1],
                colors: [Colors.blueAccent, Colors.cyanAccent],
                width: 30,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.zero, top: Radius.circular(30)))
          ]),
          BarChartGroupData(x: 2, barsSpace: 8, barRods: [
            BarChartRodData(
                y: data[2],
                colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                width: 30,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.zero, top: Radius.circular(30)))
          ]),
          BarChartGroupData(x: 3, barsSpace: 8, barRods: [
            BarChartRodData(
                y: data[3],
                colors: [Colors.yellowAccent, Colors.greenAccent],
                width: 30,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.zero, top: Radius.circular(30)))
          ]),
          BarChartGroupData(x: 4, barsSpace: 8, barRods: [
            BarChartRodData(
                y: data[4],
                colors: [Colors.tealAccent, Colors.cyan],
                width: 30,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.zero, top: Radius.circular(30)))
          ]),
        ],
      ),
    );
  }

  String transChar(String old) {
    if (old == 'clothes')
      return '衣';
    else if (old == 'food')
      return '食';
    else if (old == 'live')
      return '住';
    else if (old == 'traffic')
      return '行';
    else if (old == 'consume')
      return '用';
    else
      return old;
  }

  String transDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatDate = DateFormat('MM-dd').format(dateTime);
    return formatDate;
  }

  double findMax(List<String> lineData) {
    double max = 0;
    for (int i = 0; i < line_data.length; i++) {
      if (double.parse(line_data[i]) > max) max = double.parse(line_data[i]);
    }
    return max;
  }

}
