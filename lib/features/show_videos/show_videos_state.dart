part of 'show_videos_cubit.dart';

@immutable
sealed class ShowVideosState {}

final class ShowVideosInitial extends ShowVideosState {}
final class ShowVideosLoading extends ShowVideosState {}
final class ShowVideosSuccess extends ShowVideosState {}
final class ShowVideosFailure extends ShowVideosState {
  final String message; 

  ShowVideosFailure({required this.message});
}
