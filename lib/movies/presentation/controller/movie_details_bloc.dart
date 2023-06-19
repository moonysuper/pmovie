import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmovie/core/utils/enums.dart';
import 'package:pmovie/movies/data/model/movie_details_parameter.dart';
import 'package:pmovie/movies/domain/entities/movie_details.dart';
import 'package:pmovie/movies/domain/entities/recommendation.dart';
import 'package:pmovie/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:pmovie/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:pmovie/movies/domain/usecases/recommendation_parameter.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';



class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {
    emit(const MovieDetailsState(movieDetailsState: RequestState.loading));
    final result = await getMovieDetailsUseCase(MoveDetailsParameter(id: event.id));
    print(result);
    result.fold((l) {
      emit(state.copyWith(
          movieMessage: l.message, movieDetailsState:RequestState.error));
    }, (r) {
      emit(
          state.copyWith(movieDetailsState:RequestState.loaded, movieDetails:r));
    });
      if(result.length() == 0 )
        {
          emit(state.copyWith(
              movieMessage: 'Error in Server', movieDetailsState:RequestState.error));
        }

        }


  FutureOr<void> _getRecommendation(GetRecommendationEvent event, Emitter<MovieDetailsState> emit)async {
    emit(const MovieDetailsState(movieRecommendationState: RequestState.loading));
    final result = await getRecommendationUseCase(RecommendationParameters(id:event.id,));
    print(result);
    result.fold((l) {
      emit(state.copyWith(
          movieRecommendationMessage: l.message, movieRecommendationState:RequestState.error));
    }, (r) {
      emit(
          state.copyWith( movieRecommendationState:RequestState.loaded, movieRecommendation:r));
    });

    
  }
}
