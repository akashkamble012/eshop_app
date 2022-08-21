import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/common_message.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../../../product/domain/entities/fruit.dart';
import '../../domain/entities/Orders.dart';

abstract class OrderDataSource {
  Future<Either<Failure, Success>> putOrders(Orders orders, String userId);
  Future<Either<Failure, List<Orders>>> getOrders(String userId);
  const OrderDataSource();
}

class OrderDataSourceImpl extends OrderDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  const OrderDataSourceImpl(this._firebaseFirestore, this._firebaseAuth);
  @override
  Future<Either<Failure, List<Orders>>> getOrders(String userId) async {
    final userId1 = _firebaseAuth.currentUser?.uid;
    try {
      if (userId == null) return const Left(FailureMessage('Login To See Order'));
      final _getOrders = _firebaseFirestore.collection('/UserData').doc(userId1).collection('myOrders');
      final _d = _firebaseFirestore.collection('/UserData').doc(userId1);

      final data = await _getOrders.get();
      // _d.get().then((value) => print(value['userName']));
      List<Orders> __allOrders = [];
      for (var orders in data.docs) {
        __allOrders.add(
          Orders(
            orderId: orders.id,
            items: orders['items']
                .map<Fruits>((fruits) => Fruits.fromJson(fruits))
                //   Fruits(
                //     name: fruits['name'],
                //     aboutTheProduct: [...fruits['aboutTheProdut']],
                //     benefits: [...fruits['aboutTheProdut']],
                //     images: [...fruits['image']],
                //     description: fruits['description'],
                //     storageAndUses: [...fruits['storageAndUses']],
                //     id: fruits['id'],
                //     imageUrl: fruits['imageUrl'],
                //     offer: fruits['offer'],
                //     price: fruits['price'],
                //     unit: fruits['unit'],
                //   ),
                // )
                .toList(),
            totalPrice: orders['totalPrice'],
            discount: orders['discount'],
            itemPerPrice: orders['itemPerPrice'],
            save: orders['save'],
          ),
        );
      }
      return Right(__allOrders);
    } catch (e) {
      return const Left(FailureMessage(CommonMessage.defaultStatusFailureMessage));
    }
  }

  @override
  Future<Either<Failure, Success>> putOrders(Orders orders, String userId) async {
    final userId1 = _firebaseAuth.currentUser!.uid;
    try {
      final _toAdd = _firebaseFirestore.collection('/UserData').doc(userId1).collection('myOrders');

      final _listOfFruits = [];
      for (var fru in orders.items) {
        _listOfFruits.add(fru.toJson());
      }

      await _toAdd.add(
        {
          'items': _listOfFruits,
          'totalPrice': orders.totalPrice,
          'discount': orders.discount,
          'itemPerPrice': orders.itemPerPrice,
          'save': orders.save,
        },
      );
      return const Right(SuccessMessage(CommonMessage.defaultStatusSuccessMessage));
    } on FirebaseFirestore catch (e) {
      print('--- ${e}');
      return const Left(FailureMessage(CommonMessage.defaultStatusFailureMessage));
    }
  }
}

// {
          //   'name': fru.name,
          //   'description': fru.description,
          //   'id': fru.id,
          //   'price': fru.price,
          //   'offer': fru.offer,
          //   'unit': fru.unit,
          //   'aboutTheProdut': [...fru.aboutTheProduct!],
          //   'benefits': [...fru.benefits!],
          //   'storageAndUses': [...fru.storageAndUses!],
          //   'image': [...fru.images!],
          //   'imageUrl': fru.imageUrl
          // },