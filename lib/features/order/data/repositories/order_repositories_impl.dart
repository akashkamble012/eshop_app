import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../../domain/entities/Orders.dart';
import '../../domain/repositories/order_repositories.dart';
import '../datasources/order_data_source.dart';

class OrderRepositoriesImpl extends OrderRepositories {
  final OrderDataSource _orderDataSource;

  OrderRepositoriesImpl(this._orderDataSource);
  @override
  Future<Either<Failure, List<Orders>>> getOrders(String userId) {
    return _orderDataSource.getOrders(userId);
  }

  @override
  Future<Either<Failure, Success>> putOrders(Orders orders, String userId) {
    return _orderDataSource.putOrders(orders, userId);
  }
}
