import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/end_point.dart';
import '../../core/helpers/dio.dart';
import '../data/movies_model.dart';

part 'get_all_movies_state.dart';

class GetAllMoviesCubit extends Cubit<GetMoviesState> {
  GetAllMoviesCubit() : super(GetAllMoviesInitial());

  int page = 4;
  List<MovieModel> allMovies = [];

  Future<void> getAllMovies({bool fromPagination = false}) async {
    if (fromPagination) {
      emit(FromPaginationGetAllMoviesLoading());
    } else {
      emit(GetAllMoviesLoading());
    }
    final response =
        await DioHelper.getData(endPoint: EndPoint.allMovies, data: {
      'page': fromPagination ? ++page : 4,
    });
    if (response.isSuccess) {
      final model = MoviesData.fromJson(response.response!.data);
      allMovies.addAll(model.results);
      emit(GetAllMoviesSuccess());
    } else {
      if (fromPagination) {
        emit(FromPaginationGetAllMoviesFailure());
      } else {
        emit(GetAllMoviesFailure(message: response.message));
      }
    }
  }
}
