import 'package:equatable/equatable.dart';
import 'package:pmovie/core/utils/enums.dart';
import 'package:pmovie/movies/domain/entities/movie.dart';

class MovieStates extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovie;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieStates({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = "",
    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = "",
    this.topRatedMovie = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = "",

  });

  MovieStates copyWith({
    List<Movie>? nowPlayingMovie,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovie,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovie,
    RequestState? topRatedState,
    String? topRatedMessage,
}) {
    return MovieStates(
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      popularState: popularState ?? this.popularState,
      popularMovie: popularMovie ?? this.popularMovie,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie

    );
}

  @override
  List<Object?> get props => [
        nowPlayingMovie,
        nowPlayingState,
        nowPlayingMessage,
        popularMovie,
        popularState,
        popularMessage,
        topRatedMessage,
        topRatedState,
        topRatedMovie
      ];
}
