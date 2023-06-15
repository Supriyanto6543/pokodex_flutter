part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent extends Equatable {
  const DetailEvent();
  @override
  List<Object> get props => [];
}

class DetailEventData extends DetailEvent {
  final int id;
  DetailEventData(this.id);
}
