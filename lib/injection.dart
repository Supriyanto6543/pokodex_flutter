import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/features/data/datasource/remote_data.dart';
import 'package:pokemon/features/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/features/domain/usecase/get_home.dart';
import 'package:pokemon/features/presentation/home/bloc/home_bloc.dart';

import 'features/domain/repositories/pokemon_repository.dart';

final locator = GetIt.instance;
void init() {
  //bloc state
  locator.registerFactory(() => HomeBloc());

  //dio
  locator.registerFactory(() => Dio());

  //use case
  locator.registerFactory(() => GetHome(locator()));

  //data source
  locator.registerFactory(() => RemoteDataRepositoryImpl(locator()));

  //repository
  locator.registerFactory<PokemonRepository>(
      () => PokemonRepositoryImpl(locator()));
}
