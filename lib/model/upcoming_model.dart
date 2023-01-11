class UpComing {
  UpComing({
    required this.dates,
    required this.page,
    required this.resultsUpComing,
    required this.totalPages,
    required this.totalResults,
  });
  late final Dates dates;
  late final int page;
  late final List<ResultsUpComing > resultsUpComing ;
  late final int totalPages;
  late final int totalResults;
  
  UpComing.fromJson(Map<String, dynamic> json){
    dates = Dates.fromJson(json['dates']);
    page = json['page'];
    resultsUpComing  = List.from(json['results']).map((e)=>ResultsUpComing.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dates'] = dates.toJson();
    _data['page'] = page;
    _data['results'] = resultsUpComing .map((e)=>e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });
  late final String maximum;
  late final String minimum;
  
  Dates.fromJson(Map<String, dynamic> json){
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maximum'] = maximum;
    _data['minimum'] = minimum;
    return _data;
  }
}

class ResultsUpComing {
  ResultsUpComing ({
    required this.adult,
    // required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    // required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  // late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  // late final double? voteAverage;
  late final int voteCount;
  
  ResultsUpComing .fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    // backdropPath = json['backdrop_path'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    // voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    // _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    // _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}