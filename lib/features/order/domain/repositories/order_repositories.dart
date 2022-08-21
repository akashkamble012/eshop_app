import 'package:dartz/dartz.dart';
import 'package:eshop/core/error/success.dart';

import '../../../../core/error/failure.dart';
import '../entities/Orders.dart';

abstract class OrderRepositories {
  Future<Either<Failure, Success>> putOrders(Orders orders, String userId);
  Future<Either<Failure, List<Orders>>> getOrders(String userId);
}
