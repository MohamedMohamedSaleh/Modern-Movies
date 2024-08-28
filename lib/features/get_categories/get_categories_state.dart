part of 'get_categories_cubit.dart';

@immutable
sealed class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}
final class GetCategoriesSuccess extends GetCategoriesState {}
final class GetCategoriesFailure extends GetCategoriesState {
  final String message;
  GetCategoriesFailure({required this.message});
}
final class GetCategoriesLoading extends GetCategoriesState {}
