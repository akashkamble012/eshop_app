import 'package:dartz/dartz.dart';
import 'package:eshop/features/order/domain/repositories/order_repositories.dart';

import '../../../../core/error/failure.dart';
import '../entities/Orders.dart';

class GetOrder {
  final OrderRepositories _orderRepositories;

  const GetOrder(this._orderRepositories);

  Future<Either<Failure, List<Orders>>> call(String userId) {
    return _orderRepositories.getOrders(userId);
  }
}
