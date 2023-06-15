import 'package:equatable/equatable.dart';
import 'package:pokemon/features/domain/entities/detail_entities.dart';

class DetailModel extends Equatable {
  DetailModel({
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

  DetailModel.fromJson(Map<String, dynamic> json) {
    abilities =
        List.from(json['abilities']).map((e) => Abilities.fromJson(e)).toList();
    baseExperience = json['base_experience'];
    gameIndices = List.from(json['game_indices'])
        .map((e) => GameIndices.fromJson(e))
        .toList();
    height = json['height'];
    name = json['name'];
    species = Species.fromJson(json['species']);
    stats = List.from(json['stats']).map((e) => Stats.fromJson(e)).toList();
    types = List.from(json['types']).map((e) => Types.fromJson(e)).toList();
    weight = json['weight'];
  }

  DetailEntity toEntity() => DetailEntity(
      abilities: abilities,
      baseExperience: baseExperience,
      gameIndices: gameIndices,
      height: height,
      name: name,
      species: species,
      stats: stats,
      types: types,
      weight: weight);

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

class Abilities {
  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
  late final Ability ability;
  late final bool isHidden;
  late final int slot;

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = Ability.fromJson(json['ability']);
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ability'] = ability.toJson();
    _data['is_hidden'] = isHidden;
    _data['slot'] = slot;
    return _data;
  }
}

class Ability {
  Ability({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class GameIndices {
  GameIndices({
    required this.gameIndex,
    required this.version,
  });
  late final int gameIndex;
  late final Version version;

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = Version.fromJson(json['version']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['game_index'] = gameIndex;
    _data['version'] = version.toJson();
    return _data;
  }
}

class Version {
  Version({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Version.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Species {
  Species({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Stats {
  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
  late final int baseStat;
  late final int effort;
  late final Stat stat;

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = Stat.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['base_stat'] = baseStat;
    _data['effort'] = effort;
    _data['stat'] = stat.toJson();
    return _data;
  }
}

class Stat {
  Stat({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Types {
  Types({
    required this.slot,
    required this.type,
  });
  late final int slot;
  late final Type type;

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = Type.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slot'] = slot;
    _data['type'] = type.toJson();
    return _data;
  }
}

class Type {
  Type({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
