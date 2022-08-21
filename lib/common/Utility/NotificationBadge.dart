import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPressed;
  final int? number;

  const NotificationBadge({
    Key? key,
    this.icon,
    this.onPressed,
    this.number = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 30,
          ),
        ),
        Positioned(
          right: 2,
          top: -1,
          child: Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: number! > 0 ? Colors.red : Colors.transparent,
            ),
            child: Text(number! > 0 ? '$number' : ''),
          ),
        )
      ],
    );
  }
}
