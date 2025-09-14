// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api_result/api_result.dart' as _i898;
import '../data_source/reposartires/favourite_movies/fav_movies_repoisatory_impl.dart'
    as _i786;
import '../data_source/reposartires/movies/movies_remot_data_source.dart'
    as _i349;
import '../data_source/reposartires/movies/movies_remot_data_source_impl.dart'
    as _i25;
import '../data_source/reposartires/movies/movies_reposatories_impl.dart'
    as _i8;
import '../data_source/reposartires/movies_services/mov_services_remote_data_source.dart'
    as _i101;
import '../data_source/reposartires/movies_services/mov_services_remote_data_source_impl.dart'
    as _i356;
import '../data_source/reposartires/movies_services/mov_services_repoisatory_impl.dart'
    as _i729;
import '../domain/reposatories/fav_movies_reposatories.dart' as _i482;
import '../domain/reposatories/movies_reposatories.dart' as _i165;
import '../domain/reposatories/MoviesServices_reposatories.dart' as _i301;
import '../domain/usecase/get_movies_usecase.dart' as _i622;
import '../domain/usecase/get_profile_usecase.dart' as _i275;
import '../domain/usecase/login_usecase.dart' as _i196;
import '../domain/usecase/register_usecase.dart' as _i792;
import '../domain/usecase/update_profile_usecase.dart' as _i126;
import '../network/api/movie_api.dart' as _i214;
import '../network/api/movie_services.dart' as _i260;
import '../network/model/response/get_favourite_movies/get_favorites_movies.dart'
    as _i557;
import '../shared_pref_helper/shared_pref_helper.dart' as _i1062;
import '../ui/screens/cubit/add_fav_movies_cubit/add_fav_movies_cubit.dart'
    as _i155;
import '../ui/screens/cubit/get_fav_movies_cubit/get_fav_movies_cubit.dart'
    as _i808;
import '../ui/screens/cubit/get_fav_movies_cubit/get_fav_movies_state.dart'
    as _i826;
import '../ui/screens/cubit/get_profile_cubit/get_profile_cubit.dart' as _i756;
import '../ui/screens/cubit/login_cubit/login_cubit.dart' as _i715;
import '../ui/screens/cubit/movies_cubit/movies_cubit.dart' as _i1022;
import '../ui/screens/cubit/movies_cubit/search_movies.dart' as _i438;
import '../ui/screens/cubit/register_cubit/register_cubit.dart' as _i136;
import '../ui/screens/cubit/update_profile_cubit/update_profile_cubit.dart'
    as _i430;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final getItModule = _$GetItModule();
    gh.factory<_i1062.SharedPrefHelper>(() => _i1062.SharedPrefHelper());
    gh.lazySingleton<_i361.Dio>(() => getItModule.getDio());
    gh.factory<_i214.MovieApi>(() => _i214.MovieApi.new(gh<_i361.Dio>()));
    gh.factory<_i260.MovieService>(
        () => _i260.MovieService.new(gh<_i361.Dio>()));
    gh.factory<_i826.GetFavMoviesState>(() => _i826.GetFavMoviesState(
        getFavMovie: gh<_i898.ApiResult<_i557.GetAllFavouritesResponse>>()));
    gh.factory<_i482.FavMoviesRepo>(() => _i786.FavMoviesRepoImpl(
          gh<_i260.MovieService>(),
          gh<_i1062.SharedPrefHelper>(),
        ));
    gh.factory<_i808.GetFavMoviesCubit>(
        () => _i808.GetFavMoviesCubit(gh<_i482.FavMoviesRepo>()));
    gh.factory<_i155.FavMoviesCubit>(
        () => _i155.FavMoviesCubit(gh<_i482.FavMoviesRepo>()));
    gh.factory<_i101.MoviesServicesRemoteDataSource>(
        () => _i356.MoviesServicesRemoteDataImpl(gh<_i260.MovieService>()));
    gh.factory<_i349.MoviesRemoteDataSource>(
        () => _i25.MoviesRemoteDataSourceImpl(gh<_i214.MovieApi>()));
    gh.factory<_i301.MoviesServicesRepository>(
        () => _i729.MoviesServicesRepositoryImpl(
              gh<_i101.MoviesServicesRemoteDataSource>(),
              gh<_i1062.SharedPrefHelper>(),
            ));
    gh.factory<_i165.MoviesRepository>(
        () => _i8.MoviesReposatoryImpl(gh<_i349.MoviesRemoteDataSource>()));
    gh.factory<_i792.RegisterUseCase>(
        () => _i792.RegisterUseCase(gh<_i301.MoviesServicesRepository>()));
    gh.factory<_i196.LoginUseCase>(
        () => _i196.LoginUseCase(gh<_i301.MoviesServicesRepository>()));
    gh.factory<_i136.RegisterCubit>(
        () => _i136.RegisterCubit(gh<_i792.RegisterUseCase>()));
    gh.factory<_i126.UpdateProfileUseCase>(
        () => _i126.UpdateProfileUseCase(gh<_i301.MoviesServicesRepository>()));
    gh.factory<_i275.GetProfileUseCase>(
        () => _i275.GetProfileUseCase(gh<_i301.MoviesServicesRepository>()));
    gh.factory<_i622.GetMoviesUseCase>(
        () => _i622.GetMoviesUseCase(gh<_i165.MoviesRepository>()));
    gh.factory<_i715.LoginCubit>(
        () => _i715.LoginCubit(gh<_i196.LoginUseCase>()));
    gh.factory<_i756.GetProfileCubit>(
        () => _i756.GetProfileCubit(gh<_i275.GetProfileUseCase>()));
    gh.factory<_i430.UpdateProfileCubit>(
        () => _i430.UpdateProfileCubit(gh<_i126.UpdateProfileUseCase>()));
    gh.factory<_i1022.MoviesCubit>(
        () => _i1022.MoviesCubit(gh<_i622.GetMoviesUseCase>()));
    gh.factory<_i438.MoviesSearchCubit>(
        () => _i438.MoviesSearchCubit(gh<_i622.GetMoviesUseCase>()));
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
