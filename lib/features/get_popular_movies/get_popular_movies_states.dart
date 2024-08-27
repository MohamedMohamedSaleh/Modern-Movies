part of 'get_popular_movies_cubit.dart';

sealed class GetPopularMoviesStates {}

class GetPopularMoviesInitial extends GetPopularMoviesStates {}

class GetPopularMoviesLoading extends GetPopularMoviesStates {}

class GetPopularMoviesSuccess extends GetPopularMoviesStates {}

class GetPopularMoviesFailure extends GetPopularMoviesStates {
  final String message;

  GetPopularMoviesFailure({required this.message});
}
