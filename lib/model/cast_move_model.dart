class CastMove {
  CastMove({
    required this.id,
    required this.cast,
  });
  late final int id;
  late final List<Cast> cast;

  CastMove.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cast = List.from(json['cast']).map((e) => Cast.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cast'] = cast.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Cast {
  Cast({
    required this.id,
    required this.name,
    required this.originalName,
    this.profilePath,
  });

  late final int id;
  late final String name;
  late final String originalName;
  late final String? profilePath;

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    profilePath = json["profile_path"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['id'] = id;

    _data['name'] = name;
    _data['original_name'] = originalName;
    _data['profile_path'] = profilePath;

    return _data;
  }
}
