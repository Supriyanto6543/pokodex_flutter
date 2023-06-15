import 'package:equatable/equatable.dart';
import 'package:pokemon/features/domain/entities/home_entities.dart';

class HomeModel extends Equatable {
  HomeModel({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  HomeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  HomeEntity toEntity() => HomeEntity(name: name, url: url);

  @override
  // TODO: implement props
  List<Object?> get props => [name, url];
}
