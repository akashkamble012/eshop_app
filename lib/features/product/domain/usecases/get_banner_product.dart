import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/fruit.dart';
import '../repositories/product_domain_repositories.dart';

class GetBannerProduct {
  final ProductRepositories __productRespositories;

  GetBannerProduct(this.__productRespositories);
  Future<Either<Failure, List<Fruits>>> call() {
    return __productRespositories.getBannerProduct();
  }
}
