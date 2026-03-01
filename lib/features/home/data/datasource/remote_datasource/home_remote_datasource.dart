import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/constants/api_urls.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/core/network/dio_client.dart';
import 'package:flutter_task/features/home/data/models/product_model.dart';
import 'package:flutter_task/features/home/domain/entities/product_entity.dart';

sealed class HomeRemoteDatasource {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource{

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try{
     Response response = await sl<DioClient>().get(ApiUrls.products);
     final products = List<ProductEntity>.from(response.data.map((x) =>
         ProductModel.fromJson(x).toEntity()));
     return Right(products);
    }catch(error, stackTrace){
      log(
          "Home Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


}