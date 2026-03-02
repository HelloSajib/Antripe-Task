import 'package:dartz/dartz.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/core/usecase/no_params.dart';
import 'package:flutter_task/core/usecase/usecase.dart';
import 'package:flutter_task/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_task/features/home/domain/repositories/home_repositories.dart';

class GetContactsUseCase extends UseCase<ContactsEntity?,NoParams>{

  @override
  Future<Either<Failure, ContactsEntity?>> call({NoParams? params}) async =>
      await sl<HomeRepositories>().getContacts();

}