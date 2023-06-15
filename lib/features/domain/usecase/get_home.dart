import 'package:dartz/dartz.dart';
import 'package:pokemon/common/failure.dart';
import 'package:pokemon/features/domain/entities/home_entities.dart';
import 'package:pokemon/features/domain/repositories/pokemon_repository.dart';

class GetHome {
  final PokemonRepository repository;
  GetHome(this.repository);
  Future<Either<Failure, List<HomeEntity>>> execute(int offset) {
    return repository.getHome(offset);
  }
}
