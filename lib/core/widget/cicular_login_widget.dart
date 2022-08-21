import 'package:flutter/material.dart';

class CicularAuthWidget extends StatelessWidget {
  final double radius;
  const CicularAuthWidget({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(radius),
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
