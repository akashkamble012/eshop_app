import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/Utility/NotificationBadge.dart';
import '../../../order/presentation/pages/CartScreen.dart';
import '../bloc/product_bloc.dart';

class ProductList extends StatefulWidget {
  static const routeName = '/ProductList';

  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with SingleTickerProviderStateMixin {
  final __scaffold = GlobalKey<ScaffoldState>();
  final __scrollController = ScrollController();

  AnimationController? _sizeAnimationController;

  @override
  void initState() {
    super.initState();
    _sizeAnimationController = AnimationController(
      vsync: this,
    );
    __scrollController.addListener(() {
      double scroll = __scrollController.offset;
      _sizeAnimationController!.value = (scroll / 200);
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return Scaffold(
      key: __scaffold,
      appBar: AppBar(
        title: const Text('Fruits'),
        leading: IconButton(
          onPressed: () async {
            __scaffold.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          NotificationBadge(
            icon: Icons.notifications,
            onPressed: () {
              BlocProvider.of<ProductBloc>(context).add(const GetProduct());
              // Navigator.of(context).pushNamed(IDemo.routeName);
            },
          ),
          NotificationBadge(
            icon: Icons.shopping_cart,
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            number: 2,
          ),
        ],
      ),
      // drawer: Drawers(),
      body: Column(
        children: [
          // AnimatedBuilder(
          //   animation: _sizeAnimationController!.view,
          //   builder: (cntext, child) {
          //     return FadeTransition(
          //       opacity: Tween<double>(begin: 1.0, end: 0.0)
          //           .animate(_sizeAnimationController!.view),
          //       child: SizedBox(
          //         height: Tween<double>(begin: 200.0, end: 0.0)
          //             .animate(_sizeAnimationController!.view)
          //             .value,
          //         child: const Center(
          //           child: BannerView(),
          //           //
          //         ),
          //       ),
          //     );
          //   },
          // ),
          Expanded(
            child: GridView.builder(
              controller: __scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: media.devicePixelRatio <= 2.2 ? 2 / 4 : 2 / 4,
                // ((media.size.height) / (media.size.width)) * 0.25,
                crossAxisCount: 2,
              ),
              // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //   childAspectRatio:
              //       (media.size.height / media.size.width) * 0.17,
              //   maxCrossAxisExtent: 200,
              // ),
              itemBuilder: (_, i) => const Text('hell'),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
