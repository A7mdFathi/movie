import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/widgets/movie_item_widget.dart';

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
        appBar: AppBar(
          title: Text('More Movies'),
          centerTitle: true,
        ),
        body: BlocBuilder<MovieInfinityListBloc, MovieInfinityListState>(
          builder: (context, state) {
            if (state is MoviesLoadedState) {
              final movies = state.movies;
              return GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: state.movies.length,
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.80,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    return MovieItem(movie: movies[index]);
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
