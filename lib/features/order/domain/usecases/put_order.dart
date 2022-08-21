import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../entities/Orders.dart';
import '../repositories/order_repositories.dart';

class PutOrder {
  final OrderRepositories _orderRepositories;

  const PutOrder(this._orderRepositories);

  Future<Either<Failure, Success>> call(Orders orders, String userId){
    return _orderRepositories.putOrders(orders, userId);
  }
}
