import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/fruit.dart';
import '../repositories/product_domain_repositories.dart';

class GetAllProduct {
  final ProductRepositories __productRespositories;

  GetAllProduct(this.__productRespositories);
  Future<Either<Failure, List<Fruits>>> call() {
    return __productRespositories.getAllProduct();
  }
}
