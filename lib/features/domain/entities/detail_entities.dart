import 'package:equatable/equatable.dart';

import '../../data/model/detail_model.dart';

class DetailEntity extends Equatable {
  DetailEntity({
    required this.abilities,
    required this.baseExperience,
    required this.gameIndices,
    required this.height,
    required this.name,
    required this.species,
    required this.stats,
    required this.types,
    required this.weight,
  });
  late final List<Abilities> abilities;
  late final int baseExperience;
  late final List<GameIndices> gameIndices;
  late final int height;
  late final String name;
  late final Species species;
  late final List<Stats> stats;
  late final List<Types> types;
  late final int weight;

  @override
  // TODO: implement props
  List<Object?> get props => [
        abilities,
        baseExperience,
        gameIndices,
        height,
        name,
        species,
        stats,
        types,
        weight
      ];
}
