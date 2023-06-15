import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pokemon/common/failure.dart';
import 'package:pokemon/features/data/datasource/remote_data.dart';
import 'package:pokemon/features/domain/entities/detail_entities.dart';
import 'package:pokemon/features/domain/entities/home_entities.dart';
import 'package:pokemon/features/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final RemoteDataRepositoryImpl remoteDataRepositoryImpl;
  PokemonRepositoryImpl(this.remoteDataRepositoryImpl);

  @override
  Future<Either<Failure, DetailEntity?>> getDetail(int id) async {
    // TODO: implement getDetail
    try {
      final result = await remoteDataRepositoryImpl.getDetail(id);
      return Right(result?.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getHome(int offset) async {
    // TODO: implement getHome
    try {
      final result = await remoteDataRepositoryImpl.getHomePage(offset);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }
}
