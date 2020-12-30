import 'package:dartz/dartz.dart';
import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/entitiy.dart';

import '../repositories/repository.dart';

class GetRemoteEntities implements UseCase<List<Entity>> {
  final Repository repository;
  GetRemoteEntities(this.repository);
  @override
  Future<Either<Failure, List<Entity>>> call() async {
    return repository.getRemoteEntities();
  }
}
