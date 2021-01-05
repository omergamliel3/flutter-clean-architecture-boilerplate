import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate_project/app/core/errors/failure.dart';
import 'package:flutter_boilerplate_project/app/features/feature/domain/entities/entity.dart';

abstract class Repository {
  Future<Either<Failure, List<Entity>>> getRemoteEntities();
  Future<Either<Failure, List<Entity>>> getLocalEntities();
}
