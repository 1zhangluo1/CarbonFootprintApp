import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carbon_foot_print/common/Global.dart';
import 'package:carbon_foot_print/ui/SelfWidgets/Toast.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as old;
import 'package:get/get.dart';
import '../../models/ai_request/ai_request.dart';
import '../../models/ai_response/ai_response.dart';

class AiChat extends StatefulWidget {
  const AiChat({
    super.key,
  });

  @override
  _AiState createState() => _AiState();
}

class _AiState extends State<AiChat> with AutomaticKeepAliveClientMixin {
  List<String> answers = ['您好，有什么问题都可以问我哦'.tr].obs;
  RxList questions = [].obs;
  RxBool isSending = false.obs;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    TextEditingController inputContent = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('AI聊天'.tr),
      ),
      body: GestureDetector(
        onTap: () {
          if (Global.focusNode_ai.hasFocus) {
            Global.focusNode_ai.unfocus();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Obx(
              () => Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return index % 2 == 0
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:  7.0),
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: AutoSizeText(
                                    answers[index],
                                    textScaleFactor: 1.1,
                                  ),
                                )),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 7.0),
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: AutoSizeText(
                                    questions[index],
                                    textScaleFactor: 1.1,
                                  ),
                                )),
                              ),
                            );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount:
                        (questions.length ~/ 2) + ((answers.length + 1) ~/ 2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(
                () => Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: formKey,
                  child: TextFormField(
                    focusNode: Global.focusNode_ai,
                    controller: inputContent,
                    readOnly: isSending.value ? true : false,
                    decoration: InputDecoration(
                      labelText: "开始你的对话吧",
                      hintText: "请输入消息",
                      suffixIcon: isSending.value
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text(
                                  '生成回答中...'.tr,
                                  textScaleFactor: 1.2,
                                ),
                              ))
                          : IconButton(
                              onPressed: () async {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                if (!Global.isLogin.value) {
                                  Toast('请先登录', '登录后方可使用此功能');
                                  return;
                                }
                                isSending.value = true;
                                if (Global.focusNode_ai.hasFocus) Global.focusNode_ai.unfocus();
                                questions.add(" ");
                                questions.add(inputContent.text.toString());
                                await chat(inputContent.text);
                                inputContent.text = "";
                                isSending.value = false;
                              },
                              icon: const Icon(Icons.send)),
                      prefixIcon: const Icon(Icons.chat),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    validator: (v) {
                      return v!.isEmpty ? '内容不能为空' : null;
                    },
                    onEditingComplete: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      if (!Global.isLogin.value) {
                        Toast('请先登录', '登录后方可使用此功能');
                        return;
                      }
                      isSending.value = true;
                      questions.add(" ");
                      questions.add(inputContent.text.toString());
                      await chat(inputContent.text);
                      inputContent.text = "";
                      isSending.value = false;
                      if (Global.focusNode_ai.hasFocus) Global.focusNode_ai.unfocus();
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Future<void> chat(String question) async {
    try {
      dios.Dio dio = dios.Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ak-02cEHw1NK2suAumnWCc7bu3V4hrCJTiz0S5mbrqsyXSVhiRX'
      };
      List<Messages> messages = [];
      Messages message = Messages(role: 'user', content: question);
      messages.add(message);
      AiRequest request = AiRequest(model: 'gpt-3.5-turbo', messages: messages);
      dios.Response response = await dio.post(
          'https://api.nextapi.fun/openai/v1/chat/completions',
          data: request);
      dynamic tempAnswer = response.data;
      AiResponse answer = AiResponse.fromJson(tempAnswer);
      String content = answer.choices[0].message.content;
      answers.add(" ");
      answers.add(content);
    } on Exception catch (e) {
      old.Fluttertoast.showToast(
          msg: e.toString(),
          textColor: Colors.black,
          backgroundColor: Colors.white70);
      answers.add(" ");
      answers.add(e.toString());
    }
  }

  @override
  bool get wantKeepAlive => true;
}
