import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/features/product/domain/entities/fruit.dart';
import 'package:eshop/features/order/domain/entities/Orders.dart';

import 'package:get/get.dart';

class PlaceOrderController extends GetxController {
  List<Orders> _orders = [];

  final FirebaseFirestore __firebaseFirestore = FirebaseFirestore.instance;
  // addOrders(Orders orders) {
  //   _orders.add(orders);
  //   update();
  // }

  Future<void> putOrders(Orders orders, String userId) async {
    var _toAdd = __firebaseFirestore
        .collection('/UserData')
        .doc('$userId')
        .collection('myOrders');

    var _listOfFruits = [];
    orders.items.forEach(
      (fru) {
        _listOfFruits.add(
          {
            'name': fru.name,
            'description': fru.description,
            'id': fru.id,
            'price': fru.price,
            'offer': fru.offer,
            'unit': fru.unit,
            'aboutTheProdut': [...fru.aboutTheProduct!],
            'benefits': [...fru.benefits!],
            'storageAndUses': [...fru.storageAndUses!],
            'image': [...fru.images!],
            'imageUrl': fru.imageUrl
          },
        );
      },
    );

    await _toAdd.add(
      {
        'items': _listOfFruits,
        'totalPrice': orders.totalPrice,
        'discount': orders.discount,
        'itemPerPrice': orders.itemPerPrice,
        'save': orders.save,
      },
    );
  }

  Future<void> getOrders(String userId) async {
    var _getOrders = __firebaseFirestore
        .collection('/UserData')
        .doc('$userId')
        .collection('myOrders');
    var _d = __firebaseFirestore.collection('/UserData').doc('$userId');

    var data = await _getOrders.get();
    _d.get().then((value) => print(value['userName']));
    List<Orders> __allOrders = [];
    for (var orders in data.docs) {
        __allOrders.add(
          Orders(
            orderId: orders.id,
            items: orders['items']
                .map<Fruits>(
                  (fruits) => Fruits(
                    name: fruits['name'],
                    aboutTheProduct: [...fruits['aboutTheProdut']],
                    benefits: [...fruits['aboutTheProdut']],
                    images: [...fruits['image']],
                    description: fruits['description'],
                    storageAndUses: [...fruits['storageAndUses']],
                    id: fruits['id'],
                    imageUrl: fruits['imageUrl'],
                    offer: fruits['offer'],
                    price: fruits['price'],
                    unit: fruits['unit'],
                  ),
                )
                .toList(),
            totalPrice: orders['totalPrice'],
            discount: orders['discount'],
            itemPerPrice: orders['itemPerPrice'],
            save: orders['save'],
          ),
        );
      }
    _orders = __allOrders;
    update();
  }

  List<Orders> get orders {
    return [..._orders.reversed];
  }

  Future<void> removeOrders() async {
    _orders = [];
  }
//
}
