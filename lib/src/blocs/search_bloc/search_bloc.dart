import 'package:bloc/bloc.dart';
import 'package:movies_now/src/providers/repositories.dart';
import '../blocs.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository _repository = Repository();

  @override
  SearchState get initialState => InitialSearchState();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchPressed) {
      yield Searching();
      final movies = await _repository.searchMovies(event.searchTxt);
      yield Found(results: movies);
    }
  }
}
