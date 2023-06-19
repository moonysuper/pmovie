class ApiConstance {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "c3435cfe40aeb079689227d82bf921d3";
  static const nowPlayingMovie = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const nowPopularMovies = "$baseUrl/movie/popular?api_key=$apiKey";
  static const nowTopRatedMovies = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static  String movieDetailPath(int id) => "$baseUrl/movie/$id?api_key=$apiKey";
  static  String recommendationPath(int id) => "$baseUrl/movie/$id/recommendations?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";

}