import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/features/home/domain/entities/product_entity.dart';

abstract class HomeRepositories {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}