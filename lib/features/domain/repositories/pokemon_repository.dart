import 'package:dartz/dartz.dart';
import 'package:pokemon/common/failure.dart';
import 'package:pokemon/features/domain/entities/detail_entities.dart';
import 'package:pokemon/features/domain/entities/home_entities.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<HomeEntity>>> getHome(int offset);
  Future<Either<Failure, DetailEntity?>> getDetail(int id);
}
