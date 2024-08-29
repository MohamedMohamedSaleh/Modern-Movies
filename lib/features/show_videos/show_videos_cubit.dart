import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_movies/features/data/show_video_model.dart';

import '../../core/constant/end_point.dart';
import '../../core/helpers/dio.dart';

part 'show_videos_state.dart';

class ShowVideosCubit extends Cubit<ShowVideosState> {
  ShowVideosCubit() : super(ShowVideosInitial());

  List<VideoModel> trailererVideos = [];
  List<VideoModel> featuretteVideos = [];

  Future<void> showVideos({required int id}) async {
    emit(ShowVideosLoading());
    final response =
        await DioHelper.getData(endPoint: "${EndPoint.showVideos}$id/videos");
    if (response.isSuccess) {
      final model = ShowVideoModel.fromJson(response.response!.data);
      for (var element in model.results) {
        if (element.type == "Trailer") {
          trailererVideos.add(element);
        } else if (element.type == "Featurette") {
          featuretteVideos.add(element);
        }
      }
      print("${trailererVideos.length}, ${featuretteVideos.length}");
      emit(ShowVideosSuccess());
    } else {
      emit(ShowVideosFailure(message: response.message));
    }
  }
}
