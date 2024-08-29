import 'package:kiwi/kiwi.dart';
import 'package:modern_movies/features/get_movie/get_movie_cubit.dart';
import 'package:modern_movies/features/get_all_movies/get_all_movies_cubit.dart';
import 'package:modern_movies/features/get_categories/get_categories_cubit.dart';
import 'package:modern_movies/features/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:modern_movies/features/show_videos/show_videos_cubit.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerSingleton(
      (container) => GetPopularMoviesCubit()..getPopularMovies());
  container
      .registerSingleton((container) => GetCategoriesCubit()..getCategories());
  container
      .registerSingleton((container) => GetAllMoviesCubit()..getAllMovies());
  container.registerFactory((container) => GetMovieCubit());
  container.registerFactory((container) => ShowVideosCubit());
}
