part of 'get_characters_cubit.dart';

@immutable
sealed class GetCharactersState {}

final class GetCharactersInitial extends GetCharactersState {}

final class GetCharactersLoading extends GetCharactersState {}

final class GetCharactersSuccess extends GetCharactersState {}

final class GetCharactersFailure extends GetCharactersState {
  final String message;

  GetCharactersFailure({required this.message});
}
