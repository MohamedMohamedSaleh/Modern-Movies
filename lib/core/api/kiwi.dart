import 'package:kiwi/kiwi.dart';
import 'package:modern_movies/features/get_popular_movies/get_popular_movies_cubit.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerSingleton((container) => GetPopularMoviesCubit()..getPopularMovies());
}
