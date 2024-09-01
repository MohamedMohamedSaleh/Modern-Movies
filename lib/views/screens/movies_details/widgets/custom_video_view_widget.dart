import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:modern_movies/features/show_videos/show_videos_cubit.dart';
import 'package:modern_movies/views/screens/movies_details/widgets/custom_show_video.dart';
import 'package:modern_movies/views/widgets/app_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoTrailerWidget extends StatefulWidget {
  const CustomVideoTrailerWidget(
      {super.key,
      required this.cubit,
      this.isTrailer = true,
      required this.videoImage});
  final bool isTrailer;
  final ShowVideosCubit cubit;
  final String videoImage;

  @override
  State<CustomVideoTrailerWidget> createState() =>
      _CustomVideoTrailerWidgetState();
}

class _CustomVideoTrailerWidgetState extends State<CustomVideoTrailerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.cubit,
      builder: (context, state) {
        if (state is ShowVideosLoading) {
          return SizedBox(
            height: 200.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return SizedBox(
          height: 210.h,
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomImageVideoWidget(
                isTrailer: true,
                    index: index,
                    cubit: widget.cubit,
                    videoImage: widget.videoImage,
                  ),
              separatorBuilder: (context, index) => horizontalSpace(20),
              itemCount: widget.isTrailer
                  ? widget.cubit.trailererVideos.length
                  : widget.cubit.featuretteVideos.length),
        );
      },
    );
  }
}

class CustomFeaturetteVideo extends StatefulWidget {
  const CustomFeaturetteVideo(
      {super.key, required this.cubit, required this.videoImage});
  final ShowVideosCubit cubit;
  final String videoImage;

  @override
  State<CustomFeaturetteVideo> createState() => _CustomFeaturetteVideoState();
}

class _CustomFeaturetteVideoState extends State<CustomFeaturetteVideo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.cubit,
      builder: (context, state) {
        if (state is ShowVideosLoading) {
          return SizedBox(
            height: 200.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return SizedBox(
          height: 210.h,
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomImageVideoWidget(
                isTrailer:  false,
                    index: index,
                    cubit: widget.cubit,
                    videoImage: widget.videoImage,
                  ),
              separatorBuilder: (context, index) => horizontalSpace(20),
              itemCount: widget.cubit.featuretteVideos.length),
        );
      },
    );
  }
}

class CustomImageVideoWidget extends StatelessWidget {
  const CustomImageVideoWidget(
      {super.key,
      required this.videoImage,
      required this.cubit,
      required this.index, required this.isTrailer});
final bool isTrailer;
  final String videoImage;
  final ShowVideosCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CustomShowVideo(
            title:isTrailer? cubit.trailererVideos[index].name: cubit.featuretteVideos[index].name,
            videoKey:isTrailer? cubit.trailererVideos[index].key : cubit.featuretteVideos[index].key,
          ),
        ));
      },
      child: Container(
        height: 200.h,
        width: MediaQuery.of(context).size.width - 36,
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AppImage(
                errorImage: videoImage,
                YoutubePlayer.getThumbnail(
                    videoId:isTrailer? cubit.trailererVideos[index].key: cubit.featuretteVideos[index].key),
                height: 200.h,
                width: MediaQuery.of(context).size.width - 36,
                fit: BoxFit.cover,
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(.6),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 50,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(.5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Text(
                         isTrailer? cubit.trailererVideos[index].name : cubit.featuretteVideos[index].name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
