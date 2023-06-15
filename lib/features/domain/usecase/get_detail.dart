import 'package:dartz/dartz.dart';
import 'package:pokemon/common/failure.dart';
import 'package:pokemon/features/domain/entities/detail_entities.dart';
import 'package:pokemon/features/domain/repositories/pokemon_repository.dart';

class GetDetail {
  final PokemonRepository repository;
  GetDetail(this.repository);
  Future<Either<Failure, DetailEntity?>> execute(int id) {
    return repository.getDetail(id);
  }
}
