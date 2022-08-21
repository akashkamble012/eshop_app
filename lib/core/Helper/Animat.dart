// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../Controller/Order/OrderController.dart';
// import '../../features/product/presentation/widgets/Drawer.dart';
// import '../../common/Utility/NotificationBadge.dart';
// import '../../features/product/presentation/pages/BannerView.dart';
// import '../../features/product/presentation/widgets/FruitsCard.dart';
// import 'Data.dart';

// class AnimationPractice extends StatefulWidget {
//   static const routeName = '/Animation';

//   const AnimationPractice({Key? key}) : super(key: key);

//   @override
//   _AnimationPracticeState createState() => _AnimationPracticeState();
// }

// class _AnimationPracticeState extends State<AnimationPractice> with TickerProviderStateMixin {
//   final _scaffold = GlobalKey<ScaffoldState>();
//   final _scrollController = ScrollController();
//   final orderContorller = Get.put(OrderController());

//   AnimationController? _sizeAnimationController;

//   @override
//   void initState() {
//     super.initState();
//     _sizeAnimationController = AnimationController(
//       vsync: this,
//     );
//     _scrollController.addListener(() {
//       double scroll = _scrollController.offset;
//       _sizeAnimationController!.value = (scroll / 200);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffold,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             _scaffold.currentState!.openDrawer();
//           },
//           icon: const Icon(
//             Icons.menu,
//           ),
//         ),
//         actions: [
//           NotificationBadge(
//             icon: Icons.notifications,
//             onPressed: () {},
//           ),
//           GetBuilder<OrderController>(
//             builder: (orderContorller) => NotificationBadge(
//               icon: Icons.shopping_cart,
//               onPressed: () {},
//               number: orderContorller.orders.length,
//             ),
//           ),
//         ],
//       ),
//       drawer: Drawers(),
//       body: Column(
//         children: [
//           AnimatedBuilder(
//             animation: _sizeAnimationController!.view,
//             builder: (cntext, child) {
//               print('========Hello${_sizeAnimationController!}');
//               return FadeTransition(
//                 opacity: Tween<double>(begin: 1.0, end: 0.0).animate(_sizeAnimationController!.view),
//                 child: ScaleTransition(
//                   scale: Tween<double>(begin: 1.0, end: 0.0).animate(_sizeAnimationController!.view),
//                   child: Container(
//                     height: Tween<double>(begin: 200.0, end: 0.0).animate(_sizeAnimationController!.view).value,
//                     decoration: BoxDecoration(
//                       border: Border.all(),
//                     ),
//                     child: const Center(
//                       child: SizedBox(),
//                       //
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//           Expanded(
//             child: GridView.builder(
//               controller: _scrollController,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.59,
//               ),
//               itemBuilder: (_, i) => FruitsCard(
//                 fruits: product[i],
//               ),
//               itemCount: product.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
