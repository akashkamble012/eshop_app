import 'package:flutter/material.dart';

class Styles {
  static const sizedBox = SizedBox();
  static const sizedBoxH04 = SizedBox(height: 4);
  static const sizedBoxW04 = SizedBox(width: 4);
  static const sizedBoxH08 = SizedBox(height: 8);
  static const sizedBoxW08 = SizedBox(width: 8);
  static const sizedBoxH10 = SizedBox(height: 10);
  static const sizedBoxW10 = SizedBox(width: 10);
  static const sizedBoxH15 = SizedBox(height: 15);
  static const sizedBoxW15 = SizedBox(width: 15);
  static const sizedBoxH20 = SizedBox(height: 20);
  static const sizedBoxW20 = SizedBox(width: 20);
  static SizedBox sizeBoxH({required double height}) {
    return SizedBox(height: height);
  }

  static SizedBox sizeBoxW({required double wight}) {
    return SizedBox(width: wight);
  }

  //

  static const edgeInsetsAll10 = EdgeInsets.all(10);
  static const edgeInsetsAll15 = EdgeInsets.all(15);

  static const edgeInsetsSymVer00 = EdgeInsets.symmetric(vertical: 0.0);
  static const edgeInsetsSymHor00 = EdgeInsets.symmetric(horizontal: 0.0);

  static const edgeInsetsSymVer06 = EdgeInsets.symmetric(vertical: 6.0);
  static const edgeInsetsSymHor06 = EdgeInsets.symmetric(horizontal: 6.0);
}
