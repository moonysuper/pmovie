import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmovie/core/usecases/base_usecase.dart';
import 'package:pmovie/core/utils/enums.dart';
import 'package:pmovie/movies/domain/usecases/get_Popular_Movie_usercase.dart';
import 'package:pmovie/movies/domain/usecases/get_Top_Rated_usecase.dart';
import 'package:pmovie/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:pmovie/movies/presentation/controller/movie_event.dart';
import 'package:pmovie/movies/presentation/controller/movie_states.dart';

class MovieBloc extends Bloc<MovieEvent, MovieStates> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetPTopRatedUseCase getTopRatedUseCase;

  MovieBloc(this.getNowPlayingUseCase, this.getPopularMovieUseCase,
      this.getTopRatedUseCase)
      : super(const MovieStates()) {
    on<GetNowPlayingMovieEvent>(_getPlayingMovie);
    on<GetPopularMovieEvent>(_getPopularMovie);
    on<GetTopRatedMovieEvent>(_getTopRated);
  }

  FutureOr<void> _getPlayingMovie(
      GetNowPlayingMovieEvent event, Emitter<MovieStates> emit) async {
    emit( state.copyWith(nowPlayingState: RequestState.loading));
    final result = await getNowPlayingUseCase(const NoParameter());
    print(result);

    result.fold((l) {
      emit(state.copyWith(
          nowPlayingMessage: l.message, nowPlayingState: RequestState.error));
    }, (r) {
      emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingMovie: r));
    });
  }

  FutureOr<void> _getPopularMovie(
      GetPopularMovieEvent event, Emitter<MovieStates> emit) async {
    emit( state.copyWith(popularState: RequestState.loading));
    final result = await getPopularMovieUseCase(const NoParameter());
    print(result);
    result.fold((l) {
      emit(state.copyWith(
          popularMessage: l.message, popularState: RequestState.error));
    }, (r) {
      emit(state.copyWith(popularState: RequestState.loaded, popularMovie: r));
    });
  }

  FutureOr<void> _getTopRated(
      MovieEvent event, Emitter<MovieStates> emit) async {
    emit( state.copyWith(topRatedState: RequestState.loading));
    final result = await getTopRatedUseCase(const NoParameter());
    print(result);
    result.fold((l) {
      emit(state.copyWith(
          topRatedMessage: l.message, topRatedState: RequestState.error));
    }, (r) {
      emit(
          state.copyWith(topRatedState: RequestState.loaded, topRatedMovie: r));
    });
  }
}
