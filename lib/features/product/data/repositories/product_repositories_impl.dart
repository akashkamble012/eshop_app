import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/fruit.dart';
import '../../domain/repositories/product_domain_repositories.dart';
import '../datasources/product_datasource.dart';

class ProductRepositoriesImpl extends ProductRepositories {
  final ProductDataSources __productDataSource;

  ProductRepositoriesImpl(this.__productDataSource);
  @override
  Future<Either<Failure, List<Fruits>>> getAllProduct() {
    return __productDataSource.getAllProduct();
  }

  @override
  Future<Either<Failure, List<Fruits>>> getBannerProduct() {
    return __productDataSource.getBannerProduct();
  }
}
