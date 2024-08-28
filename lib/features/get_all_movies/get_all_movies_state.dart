part of 'get_all_movies_cubit.dart';

@immutable
sealed class GetMoviesState {}

final class GetAllMoviesInitial extends GetMoviesState {}

// All Movies
final class GetAllMoviesSuccess extends GetMoviesState {}

final class GetAllMoviesFailure extends GetMoviesState {
  final String message;
  GetAllMoviesFailure({required this.message});
}

final class GetAllMoviesLoading extends GetMoviesState {}

// from Pagination

final class FromPaginationGetAllMoviesLoading extends GetMoviesState {}

final class FromPaginationGetAllMoviesFailure extends GetMoviesState {
  final String message = "there are no more movies";
}
