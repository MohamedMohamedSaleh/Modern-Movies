import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_movies/features/data/show_movie_data.dart';

import '../../core/constant/end_point.dart';
import '../../core/helpers/dio.dart';

part 'get_movie_state.dart';

class GetMovieCubit extends Cubit<GetMovieState> {
  GetMovieCubit() : super(GetMovieInitial());

  Future<void> getMovie({required int id}) async {
    emit(GetMovieLoading());
    final response =
        await DioHelper.getData(endPoint: "${EndPoint.getMovie}$id",);
    if (response.isSuccess) {
      final movieData = ShowMovieData.fromJson(response.response!.data);
      print(movieData.genres);
      emit(GetMovieSuccess(movieData: movieData));
    } else {
      emit(GetMovieFailure(message: response.message));
    }
  }
}
