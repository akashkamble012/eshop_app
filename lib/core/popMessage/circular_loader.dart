import 'package:eshop/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.primaryColor,
      ),
    );
  }
}
