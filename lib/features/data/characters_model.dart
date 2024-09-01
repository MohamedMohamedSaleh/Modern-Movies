class CharactersData {
  CharactersData({
    required this.id,
    required this.actors,
    required this.productionTeam,
  });
  late final int id;
  late final List<Actors> actors;
  late final List<ProductionTeam> productionTeam;

  CharactersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actors = List.from(json['cast']).map((e) => Actors.fromJson(e)).toList();
    productionTeam = List.from(json['crew']).map((e) => ProductionTeam.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Actors {
  late final bool adult;
  late final int gender;
  late final int id;
  late final String knownForDepartment;
  late final String name;
  late final String originalName;
  late final double popularity;
  late final String? profilePath;
  late final int castId;
  late final String character;
  late final String creditId;
  late final int order;

  Actors.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = null;
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }
}

class ProductionTeam {
  late final bool adult;
  late final int gender;
  late final int id;
  late final String knownForDepartment;
  late final String name;
  late final String originalName;
  late final double popularity;
  late final String? profilePath;
  late final String creditId;
  late final String department;
  late final String job;

  ProductionTeam.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = null;
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }
}
