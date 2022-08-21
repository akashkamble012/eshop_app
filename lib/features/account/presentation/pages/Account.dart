import 'package:flutter/material.dart';

import '../../../../core/Helper/styles.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/ProfileImage.dart';

class Account extends StatelessWidget {
  static const routeName = '/Account';
  const Account({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        children: [
          Container(
            padding: Styles.edgeInsetsAll15,
            alignment: Alignment.center,
            child: const ProfileImage(),
          ),
          const Divider(thickness: 2),
          const ListTile(
            title: Text('Name'),
            subtitle: Text('unKnow'),
          ),
          const ListTile(
            title: Text('Email'),
            subtitle: Text(
              'example@gmail.com',
            ),
          ),
          const ListTile(
            title: Text('Contact'),
            subtitle: Text(
              '000000000000',
            ),
          ),
        ],
      ),
    );
  }
}
