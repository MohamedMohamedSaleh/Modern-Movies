part of 'get_movie_cubit.dart';

@immutable
sealed class GetMovieState {}

final class GetMovieInitial extends GetMovieState {}

final class GetMovieLoading extends GetMovieState {}

final class GetMovieSuccess extends GetMovieState {
  final ShowMovieData movieData;

  GetMovieSuccess({required this.movieData});
}

final class GetMovieFailure extends GetMovieState {
  final String message;

  GetMovieFailure({required this.message});
}
