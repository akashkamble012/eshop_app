// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'ProductView.dart';

// class BannerView extends StatelessWidget {
//   const BannerView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     // Get.find<ProducttController>();
//     return GetBuilder<ProducttController>(
//       builder: (product) {
//         return ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           scrollDirection: Axis.horizontal,
//           itemCount: product.bannerProduct.length,
//           itemBuilder: (_, i) => SizedBox(
//             width: screenSize.width * 0.92,
//             child: InkWell(
//               splashColor: Theme.of(context).primaryColor,
//               onTap: () {
//                 Navigator.of(context).pushNamed(
//                   ProductView.routeName,
//                   arguments: product.bannerProduct[i],
//                 );
//               },
//               child: Card(
//                 elevation: 2.0,
//                 child: Image.network(product.bannerProduct[i].imageUrl!),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


