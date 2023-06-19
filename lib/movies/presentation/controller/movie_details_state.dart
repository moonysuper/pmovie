part of 'movie_details_bloc.dart';

 class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieMessage;
  final List<Recommendation> movieRecommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieMessage = '',
    this.movieRecommendation = const [],
    this.movieRecommendationMessage = '',
    this.movieRecommendationState = RequestState.loading,

  });
  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieMessage,
    List<Recommendation>? movieRecommendation,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessage,
 }){
    return MovieDetailsState(
          movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieMessage: movieMessage ?? this.movieMessage,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        movieRecommendationMessage: movieRecommendationMessage ?? this.movieRecommendationMessage,
        movieRecommendationState: movieRecommendationState ?? this.movieRecommendationState
    );
}
  @override
  List<Object?> get props => [movieDetails, movieDetailsState, movieMessage,movieRecommendation,movieRecommendationMessage,movieRecommendationState];
}
