import 'package:carbon_foot_print/Utils/TimerFormat.dart';
import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/models/Record.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as old;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../SelfWidgets/Toast.dart';

class History extends StatefulWidget {
  const History({
    super.key,
  });

  @override
  _Record createState() => _Record();
}

class _Record extends State<History> {
  List<Record> records = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "历史记录".tr,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Global.isLogin.value
                ? FutureBuilder(
                    future: getRecords(),
                    initialData: records,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return records.isEmpty
                              ? const Center(
                                  child: Text(
                                  '无任何历史记录！',
                                  textScaleFactor: 2.5,
                                  style: TextStyle(color: Colors.grey),
                                ))
                              : ListView.separated(
                                  itemCount: records.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ListTile(
                                          title: Text("CO2排放记录".tr),
                                          subtitle: Align(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "种类：${records[index].useName}"),
                                                Text(
                                                    "消耗量：${records[index].useCounts}${records[index].useType}"),
                                              ],
                                            ),
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text.rich(
                                                TextSpan(children: [
                                                  TextSpan(
                                                      text: "碳排放：".tr,
                                                      style: const TextStyle()),
                                                  TextSpan(
                                                      text:
                                                          "${records[index].calculateResult}kg",
                                                      style: TextStyle(
                                                        color: records[index]
                                                                    .calculateResult >
                                                                50
                                                            ? Colors.red
                                                            : Theme.of(context)
                                                                .colorScheme
                                                                .primary,
                                                      )),
                                                ]),
                                                textScaleFactor: 1.4,
                                              ),
                                              Text(
                                                timerFormat(records[index].createdAt),
                                                textScaleFactor: 1.2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 8,
                                    );
                                  },
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
                    })
                : const Center(
                    child: Text(
                      "未登录",
                      textScaleFactor: 3,
                    ),
                  )));
  }

  Future<void> getRecords() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("token") ?? "";
      dios.Dio dio = dios.Dio();
      dio.options.headers = {
        'token': token,
      };
      dios.Response response =
          await dio.get('https://carbon.jzhangluo.com/v1/record');
      if (response.data['code'] == 200) {
        List<dynamic> recordsTemp = response.data['msg'];
        records = recordsTemp.map((e) => Record.fromJson(e)).toList();
      } else {
        Toast('获取记录失败', response.data['msg']);
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
}
