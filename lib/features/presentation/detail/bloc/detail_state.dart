part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoaded extends DetailState {
  final DetailEntity data;
  final StatusEnum statusEnum;

  DetailLoaded(this.data, this.statusEnum);
}

class DetailError extends DetailState {
  final StatusEnum statusEnum;
  final String message;
  DetailError(this.statusEnum, this.message);
}
