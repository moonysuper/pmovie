import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmovie/core/network/api_constance.dart';
import 'package:pmovie/core/services/services_locator.dart';
import 'package:pmovie/core/utils/enums.dart';
import 'package:pmovie/movies/domain/entities/genres.dart';
import 'package:pmovie/movies/presentation/controller/movie_details_bloc.dart';
import 'package:pmovie/movies/presentation/screens/dummy.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetRecommendationEvent(id)),
      lazy: false,
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {


  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        print(state.movieDetailsState);
      switch(state.movieDetailsState)
      {
        case RequestState.loading:
          return const Center(child: CircularProgressIndicator(),);
        case RequestState.loaded:
            return CustomScrollView(
            key: const Key('movieDetailScrollView'),
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 1.0, 1.0],
                        ).createShader(
                          Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        imageUrl: ApiConstance.imageUrl(state.movieDetails!.bgPatch),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.movieDetails!.title,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            )),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                state.movieDetails!.releaseDate.split('-')[0],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  (state.movieDetails!.voteAverage / 2).toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '(${state.movieDetails!.voteAverage})',
                                  style: const TextStyle(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              _showDuration(state.movieDetails!.runTime),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          state.movieDetails!.overView,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Genres: ${_showGenres(state.movieDetails!.genres)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'More like this'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              // Tab(text: 'More like this'.toUpperCase()),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                sliver: _showRecommendations()
              ),
            ],
          );
        case RequestState.error:
          return  Text(state.movieMessage,style: const TextStyle(color: Colors.white,fontSize: 20),);
      }
  },
);
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {

       switch(state.movieRecommendationState)
       {
         case RequestState.loading:
           return SliverGrid(
             delegate: SliverChildBuilderDelegate(
                   (context, index) {

                 return const SizedBox(
                   height: 170.0,
                   child: Center(child: CircularProgressIndicator(),),
                 );
               },
               childCount: 1,
             ),
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               mainAxisSpacing: 8.0,
               crossAxisSpacing: 8.0,
               childAspectRatio: 0.7,
               crossAxisCount: 3,
             ),
           );
         case RequestState.loaded:
           return SliverGrid(
             delegate: SliverChildBuilderDelegate(
                   (context, index) {
                 final recommendation = state.movieRecommendation[index];
                 return InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: recommendation.id)));
                   },
                   child: FadeInUp(
                     from: 20,
                     duration: const Duration(milliseconds: 500),
                     child: ClipRRect(
                       borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                       child: CachedNetworkImage(
                         imageUrl: ApiConstance.imageUrl(recommendation.backdropPath.toString()),
                         placeholder: (context, url) => Shimmer.fromColors(
                           baseColor: Colors.grey[850]!,
                           highlightColor: Colors.grey[800]!,
                           child: Container(
                             height: 170.0,
                             width: 120.0,
                             decoration: BoxDecoration(
                               color: Colors.black,
                               borderRadius: BorderRadius.circular(8.0),
                             ),
                           ),
                         ),
                         errorWidget: (context, url, error) => const Icon(Icons.error),
                         height: 180.0,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 );
               },
               childCount: recommendationDummy.length,
             ),
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               mainAxisSpacing: 8.0,
               crossAxisSpacing: 8.0,
               childAspectRatio: 0.7,
               crossAxisCount: 3,
             ),
           );
         case RequestState.error:
           return const Text("Error");
       }
  },
);
  }
}
