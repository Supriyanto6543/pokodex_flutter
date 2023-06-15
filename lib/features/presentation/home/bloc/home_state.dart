part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeEntity> list;
  final StatusEnum statusEnum;

  HomeLoaded(this.list, this.statusEnum);
}

class HomeError extends HomeState {
  final StatusEnum statusEnum;
  final String message;
  HomeError(this.statusEnum, this.message);
}
