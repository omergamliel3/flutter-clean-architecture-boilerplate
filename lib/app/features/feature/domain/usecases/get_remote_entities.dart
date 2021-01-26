import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate_project/app/core/errors/failure.dart';
import 'package:flutter_boilerplate_project/app/core/usecases/usecase.dart';

import '../entities/entity.dart';

import '../repositories/repository.dart';

class GetRemoteEntities implements UseCase<List<Entity>, NoParams> {
  final Repository repository;
  GetRemoteEntities(this.repository);
  @override
  Future<Either<Failure, List<Entity>>> call(n) async {
    return repository.getRemoteEntities();
  }
}
