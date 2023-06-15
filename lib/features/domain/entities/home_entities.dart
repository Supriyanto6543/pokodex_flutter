import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  HomeEntity({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  @override
  // TODO: implement props
  List<Object?> get props => [name, url];
}
