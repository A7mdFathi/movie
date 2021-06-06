class BaseApiUrls {
  static const String BASE_URL = 'https://api.themoviedb.org/3';
  static const String API_KEY = '?api_key=839e0f1f7cecbe93d6468b54e0742055';
  static const String IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/w500';
  static const String MOVIE = '$BASE_URL/movie/{movie_id}$API_KEY$APPEND_TO_RESPONSE';
  static const String MOVIES_LIST = '$BASE_URL/movie/{movies_list}$API_KEY&page=';
  static const String SEARCH_MOVIE =
      '$BASE_URL/search/movie$API_KEY&query={query}';
  static const String VIDEO_BASE_URL = "https://www.youtube.com/watch?v={key}";
  static const String APPEND_TO_RESPONSE = '&append_to_response=videos,images';
  static const String MOVIE_CREDITS =
      '$BASE_URL/movie/{movie_id}/credits$API_KEY';
  static const String MOVIES_BY_PERSON_ID =
      '$BASE_URL/person/{person_id}/movie_credits$API_KEY';
  static const String CAST_DETAILS = "$BASE_URL/person/{cast_id}$API_KEY";
  static const String MOVIES_SIMILAR='$BASE_URL/movie/{movie_id}/recommendations';
}
