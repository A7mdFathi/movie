import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_urls.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MorePopularMovies extends StatefulWidget {
  @override
  _MorePopularMoviesState createState() => _MorePopularMoviesState();
}

class _MorePopularMoviesState extends State<MorePopularMovies> {
  ScrollController _scrollController;
  bool _isLoading = false;
  int pageCount = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 0,
      keepScrollOffset: true,
    )..addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MovieInfinityListBloc, MovieInfinityListState>(
          builder: (context, state) {
            if (state is MoviesLoadedState) {
              final movies = state.movies;
              return GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: state.movies.length,
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.80,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0,
                  ),
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: movies[index].poster_path == null
                            ? Image.asset(
                                'assets/movie_placeholder.jpg',
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                fadeOutCurve: Curves.easeOut,
                                placeholder: (context, url) => Image.asset(
                                  'assets/movie_placeholder.jpg',
                                  fit: BoxFit.cover,
                                ),
                                fadeInCurve: Curves.easeIn,
                                imageUrl: BaseApiUrls.IMAGE_BASE_URL +
                                    movies[index].poster_path,
                                fit: BoxFit.cover,
                              ),
                      ),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<MovieInfinityListBloc>().add(NextPageFetched());
    }
  }
}
