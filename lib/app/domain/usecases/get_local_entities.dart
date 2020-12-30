import 'package:dartz/dartz.dart';
import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/entitiy.dart';
import '../repositories/repository.dart';

class GetLocalEntities implements UseCase<List<Entity>> {
  final Repository repository;
  GetLocalEntities(this.repository);
  @override
  Future<Either<Failure, List<Entity>>> call() async {
    await Future.delayed(const Duration(seconds: 1));
    return repository.getLocalEntities();
  }
}
