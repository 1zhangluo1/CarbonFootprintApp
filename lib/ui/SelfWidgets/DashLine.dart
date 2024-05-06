import 'package:flutter/material.dart';

class LDashedLine extends StatelessWidget {
  final Axis axis; // 水平方向 & 垂直方向
  final double dashedWidth; // 虚线宽度
  final double dashedHeight; // 虚线高度
  final int count; // 虚线总个数
  final Color dashedColor; // 虚线颜色
  final double dashedTotalLengthWith; // 虚线水平垂直总长度

  LDashedLine({
    required this.axis,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.dashedColor = Colors.black,
    this.dashedTotalLengthWith = 200,
  });

  Widget showDashedLineWidgets() {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: dashedColor),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return axis == Axis.horizontal
              ? Container(
              width: dashedTotalLengthWith, child: showDashedLineWidgets())
              : Container(
              height: dashedTotalLengthWith, child: showDashedLineWidgets());
        });
  }
}
