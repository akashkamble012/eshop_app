import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:eshop/common/common_message.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/fruit.dart';

abstract class ProductDataSources {
  Future<Either<Failure, List<Fruits>>> getAllProduct();
  Future<Either<Failure, List<Fruits>>> getBannerProduct();
}

class ProductDataSourcesImplement extends ProductDataSources {
  final __getProdcutData = <Fruits>[];
  final FirebaseFirestore __fireBaseStore;

  ProductDataSourcesImplement(this.__fireBaseStore);
  @override
  Future<Either<Failure, List<Fruits>>> getAllProduct() async {
    __getProdcutData.clear();
    try {
      var allData = await __fireBaseStore.collection('/AllProduct').get().timeout(const Duration(seconds: 10));

      for (var items in allData.docs) {
        __getProdcutData.add(
          FruitsModel(
            id: items.id,
            name: items['name'],
            price: items['price'],
            offer: items['offer'],
            unit: items['unit'],
            offPrice: items['price'] - (items['price'] * items['offer'] / 100),
            save: items['price'] * items['offer'] / 100,
            aboutTheProduct: [...items['aboutTheProdut']],
            benefits: [...items['benefits']],
            description: items['description'],
            storageAndUses: [...items['storageAndUses']],
            imageUrl: items['imageUrl'],
            images: [...items['image']],
          ),
        );
      }
      // offPrice = price! - (price * offer! / 100),
      //       save = (price * offer / 100);
      return Right(__getProdcutData);
    } on SocketException catch (_) {
      return const Left(FailureMessage(CommonMessage.noConnection));
    } on FormatException catch (_) {
      return const Left(FailureMessage(CommonMessage.badFormat));
    } on TimeoutException catch (_) {
      return const Left(FailureMessage(CommonMessage.timeout));
    } catch (error) {
      print('Get Product Data --> $error');
      return const Left(FailureMessage(CommonMessage.checkYourNetworkConnection));
    }
  }

  @override
  Future<Either<Failure, List<Fruits>>> getBannerProduct() async {
    if (__getProdcutData.isNotEmpty) {
      return Right(__getProdcutData.sublist(4, __getProdcutData.length));
    } else {
      return const Left(FailureMessage(CommonMessage.emptyList));
    }
  }
}
