import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/fruit.dart';

abstract class ProductRepositories {
  Future<Either<Failure, List<Fruits>>> getAllProduct();
  Future<Either<Failure, List<Fruits>>> getBannerProduct();
}
