class TrendingMoves {
  TrendingMoves({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<ResultsTending> results;
  late final int totalPages;
  late final int totalResults;
  
  TrendingMoves.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>ResultsTending.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class ResultsTending {
  ResultsTending({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });
  late final bool adult;
  late final String backdropPath;
  late final int id;
  late final String name;
  late final String originalLanguage;
  late final String originalName;
  late final String overview;
  late final String posterPath;
  late final String mediaType;
  late final List<int> genreIds;
  late final double popularity;
  late final String firstAirDate;
  late final double voteAverage;
  late final int voteCount;
  late final List<String> originCountry;
  
  ResultsTending.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    popularity = json['popularity'];
    firstAirDate = json['first_air_date'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    originCountry = List.castFrom<dynamic, String>(json['origin_country']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['id'] = id;
    _data['name'] = name;
    _data['original_language'] = originalLanguage;
    _data['original_name'] = originalName;
    _data['overview'] = overview;
    _data['poster_path'] = posterPath;
    _data['media_type'] = mediaType;
    _data['genre_ids'] = genreIds;
    _data['popularity'] = popularity;
    _data['first_air_date'] = firstAirDate;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    _data['origin_country'] = originCountry;
    return _data;
  }
}