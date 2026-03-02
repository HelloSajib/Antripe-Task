import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/constants/api_urls.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/core/network/dio_client.dart';
import 'package:flutter_task/features/home/data/models/contacts_model.dart';
import 'package:flutter_task/features/home/domain/entities/contact_entity.dart';

sealed class HomeRemoteDatasource {
  Future<Either<Failure, ContactsEntity?>> getContacts();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource{

  @override
  Future<Either<Failure, ContactsEntity?>> getContacts() async {
    try{
     Response response = await sl<DioClient>().get(ApiUrls.products);
     final contactEntity = ContactsModel.fromJson(response.data).contactsData?.toEntity();
     return Right(contactEntity);
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