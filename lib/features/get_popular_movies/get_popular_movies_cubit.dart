import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_movies/core/constant/end_point.dart';
import 'package:modern_movies/features/data/movies_model.dart';

import '../../core/helpers/dio.dart';

part 'get_popular_movies_states.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesStates> {
  GetPopularMoviesCubit() : super(GetPopularMoviesInitial());

  int page = 1;
  List<MovieModel> popularMovies = [];

  Future<void> getPopularMovies({bool fromPagination = false}) async {
    if (fromPagination) {
      emit(FromPaginationGetPopularMoviesLoading());
    } else {
      emit(GetPopularMoviesLoading());
    }
    final response =
        await DioHelper.getData(endPoint: EndPoint.popularMovies, data: {
      'page': fromPagination ? ++page : 1,
    });
    if (response.isSuccess) {
      final model = MoviesData.fromJson(response.response!.data);
      popularMovies.addAll(model.results);
      emit(GetPopularMoviesSuccess());
    } else {
      if (fromPagination) {
        emit(FromPaginationGetPopularMoviesFailure());
      } else {
        emit(GetPopularMoviesFailure(message: response.message));
      }
    }
  }
}
