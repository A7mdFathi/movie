// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/api_base_helper.dart' as _i3;
import '../blocs/app_theme_cubit/app_theme_cubit.dart' as _i23;
import '../blocs/bloc_observer.dart' as _i20;
import '../blocs/movie_credits_cubit/movie_credits_cubit.dart' as _i7;
import '../blocs/movie_details_cubit/movie_details_cubit.dart' as _i8;
import '../blocs/movie_infinity_list_bloc/movie_infinity_list_bloc.dart' as _i9;
import '../blocs/movie_search_bloc/movie_search_bloc.dart' as _i11;
import '../blocs/movie_week_bloc/movie_week_cubit.dart' as _i12;
import '../blocs/movies_list_cubit/movies_list_cubit.dart' as _i15;
import '../blocs/movies_peopleid_cubit/movies_by_personid_cubit.dart' as _i14;
import '../blocs/movies_similar_cubit/movies_similar_cubit.dart' as _i17;
import '../blocs/person_details_cubit/person_details_cubit.dart' as _i18;
import '../models/credits/credit_model.dart' as _i4;
import '../models/genre/movie_genre.dart' as _i5;
import '../models/images/image_model.dart' as _i6;
import '../models/movies/movie_model.dart' as _i10;
import '../models/movies/movies_response.dart' as _i16;
import '../models/movies_by_personid/movies_by_personid.dart' as _i13;
import '../models/person/person_model.dart' as _i19;
import '../models/trailers/trailer_model.dart' as _i21;
import '../repositories/repository.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ApiBaseHelper>(() => _i3.ApiBaseHelper());
  gh.factory<_i4.Cast>(() => _i4.Cast.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i4.CreditModel>(
      () => _i4.CreditModel.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i4.Crew>(() => _i4.Crew.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i5.Genre>(() => _i5.Genre.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i6.ImageModel>(
      () => _i6.ImageModel.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i6.ImagesResponse>(
      () => _i6.ImagesResponse.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i7.MovieCreditsCubit>(() => _i7.MovieCreditsCubit());
  gh.factory<_i8.MovieDetailsCubit>(() => _i8.MovieDetailsCubit());
  gh.factory<_i9.MovieInfinityListBloc>(() => _i9.MovieInfinityListBloc());
  gh.factory<_i10.MovieModel>(
      () => _i10.MovieModel.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i11.MovieSearchBloc>(() => _i11.MovieSearchBloc());
  gh.factory<_i12.MovieThisWeekCubit>(() => _i12.MovieThisWeekCubit());
  gh.factory<_i13.MoviesByPersonId>(
      () => _i13.MoviesByPersonId.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i14.MoviesByPersonIdCubit>(() => _i14.MoviesByPersonIdCubit());
  gh.factory<_i15.MoviesListCubit>(() => _i15.MoviesListCubit());
  gh.factory<_i16.MoviesResponse>(
      () => _i16.MoviesResponse.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i17.MoviesSimilarCubit>(() => _i17.MoviesSimilarCubit());
  gh.factory<_i18.PersonDetailsCubit>(() => _i18.PersonDetailsCubit());
  gh.factory<_i19.PersonModel>(
      () => _i19.PersonModel.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i20.SimpleBlocObserver>(() => _i20.SimpleBlocObserver());
  gh.factory<_i21.TrailerModel>(
      () => _i21.TrailerModel.fromJson(get<Map<String, dynamic>>()));
  gh.factory<_i21.TrailerResponse>(
      () => _i21.TrailerResponse.fromJson(get<Map<String, dynamic>>()));
  gh.singleton<_i22.Repository>(_i22.Repository());
  gh.singleton<_i23.ThemeCubit>(_i23.ThemeCubit());
  return get;
}
