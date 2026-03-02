import 'package:dartz/dartz.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/features/home/data/datasource/remote_datasource/home_remote_datasource.dart';
import 'package:flutter_task/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_task/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl implements HomeRepositories{

  @override
  Future<Either<Failure, ContactsEntity?>> getContacts() async =>
      await sl<HomeRemoteDatasource>().getContacts();

}