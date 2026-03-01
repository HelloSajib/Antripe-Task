import 'package:dartz/dartz.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/core/usecase/no_params.dart';
import 'package:flutter_task/core/usecase/usecase.dart';
import 'package:flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter_task/features/home/domain/repositories/home_repositories.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>,NoParams>{

  @override
  Future<Either<Failure, List<ProductEntity>>> call({NoParams? params}) async =>
      await sl<HomeRepositories>().getProducts();

}