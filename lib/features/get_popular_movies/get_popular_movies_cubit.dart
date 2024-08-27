



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_movies/core/constant/end_point.dart';
import 'package:modern_movies/features/data/movies_model.dart';

import '../../core/helpers/dio.dart';

part 'get_popular_movies_states.dart';


class GetPopularMoviesCubit extends Cubit<GetPopularMoviesStates>  {

  GetPopularMoviesCubit() : super(GetPopularMoviesInitial());


  List<MovieModel> popularMovies = [];

  Future<void> getPopularMovies({bool fromPagination = false}) async {
    emit(GetPopularMoviesLoading());
    final response = await DioHelper.getData(
      endPoint: EndPoint.popularMovies,
    );
    if (response.isSuccess) {
      final model = MoviesData.fromJson(response.response!.data);
      popularMovies = model.results;
      emit(GetPopularMoviesSuccess());



    }else{
      
      emit(GetPopularMoviesFailure(message: response.message));
    }
    }
}  