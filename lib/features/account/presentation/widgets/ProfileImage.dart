import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset('assets/DefaultProfile/Profile.png'),
        ),
        Positioned(
          right: -10.0,
          bottom: 10.0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
