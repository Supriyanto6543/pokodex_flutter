part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeEventList extends HomeEvent {
  final int offset;
  HomeEventList(this.offset);
}
