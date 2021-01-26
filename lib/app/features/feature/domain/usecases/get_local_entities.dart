import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate_project/app/core/errors/failure.dart';
import 'package:flutter_boilerplate_project/app/core/usecases/usecase.dart';

import '../entities/entity.dart';
import '../repositories/repository.dart';

class GetLocalEntities implements UseCase<List<Entity>, NoParams> {
  final Repository repository;
  GetLocalEntities(this.repository);
  @override
  Future<Either<Failure, List<Entity>>> call(NoParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return repository.getLocalEntities();
  }
}
