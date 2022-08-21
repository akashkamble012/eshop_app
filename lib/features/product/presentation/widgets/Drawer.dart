import 'package:flutter/material.dart';

import '../../../../core/popMessage/dialog/alert_dialog_box.dart';
import '../../../../injection_container.dart';
import '../../../account/presentation/pages/Account.dart';
import '../../../auth/domain/usecases/user_change.dart';
import '../../../auth/presentation/pages/signInScreen.dart';
import '../../../order/presentation/pages/CartScreen.dart';
import '../../../order/presentation/pages/OrderScreen.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top + kToolbarHeight,
            width: double.infinity,
            color: Colors.green,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Account.routeName);
            },
            dense: false,
            enableFeedback: true,
            title: const Text('My Account'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
            title: const Text('My Orders'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            title: const Text('My Cart'),
          ),
          ListTile(
            onTap: () {},
            title: const Text('My Notification'),
          ),
          StreamBuilder(
            stream: getIt<UserChanges>().call(),
            builder: ((context, snapshot) {
              print('user Change User $snapshot');
              if (snapshot.data == null) {
                return ListTile(
                  onTap: () async {
                    Navigator.of(context).pushNamed(SignIn.routeName, arguments: {
                      'drawer': true,
                    });
                  },
                  title: const Text('Log in'),
                );
              } else {
                return ListTile(
                  onTap: () async {
                    AlertDialogBoxs.logoutDialog(context);
                  },
                  title: const Text('Logout'),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
