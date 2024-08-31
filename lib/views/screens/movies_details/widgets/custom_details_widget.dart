import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/features/data/show_movie_data.dart';
import 'package:modern_movies/features/show_videos/show_videos_cubit.dart';
import 'package:modern_movies/views/screens/movies_details/models/images_view_model.dart';
import 'package:modern_movies/views/screens/movies_details/models/vote_count_model.dart';
import 'package:modern_movies/views/screens/movies_details/widgets/custom_images_view_widget.dart';
import 'package:modern_movies/views/widgets/app_image.dart';

import '../../../../core/helpers/methods.dart';
import 'custom_video_view_widget.dart';
import 'custom_vote_count_widget.dart';

class CustomDetailsWidget extends StatefulWidget {
  final ShowMovieData movieModel;
  final ShowVideosCubit videosCubit;

  const CustomDetailsWidget({
    super.key,
    required this.movieModel,
    required this.videosCubit,
  });

  @override
  State<CustomDetailsWidget> createState() => _CustomDetailsWidgetState();
}

class _CustomDetailsWidgetState extends State<CustomDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImagesViewWidget(
            model: MovieImagesModel(
                backdropPath: widget.movieModel.backdropPath,
                image: widget.movieModel.posterPath,
                date: widget.movieModel.releaseDate,
                status: widget.movieModel.status,
                title: widget.movieModel.title),
          ),
          CustomVoteCountWidget(
            model: VoteCountModel(
                popularity: widget.movieModel.popularity,
                voteCount: widget.movieModel.voteCount,
                rate: widget.movieModel.voteAverage),
          ),
          verticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 14,
                    offset: const Offset(0, 8),
                  )
                ],
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.movieModel.overview,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),

                      textAlign: TextAlign.start,
                      // textDirection: TextDirection.ltr,
                    ),
                  ),
                  verticalSpace(10),
                  SizedBox(
                    height: 50.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 5,
                        direction: Axis.horizontal,
                        children: [
                          ...List.generate(
                            widget.movieModel.genres.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                // alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        widget.movieModel.genres[index].name,
                                      ),
                                      horizontalSpace(5),
                                      Icon(
                                        Icons.double_arrow_rounded,
                                        size: 16.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(10),
                  Text("Post production",
                      style: Theme.of(context).textTheme.bodyLarge),
                  verticalSpace(5),
                  SizedBox(
                    height: 100.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 16,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(
                            widget.movieModel.productionCompanies.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: widget.movieModel.productionCompanies[index]
                                          .logoPath?.isNotEmpty ??
                                      false
                                  ? AppImage(
                                      widget.movieModel
                                          .productionCompanies[index].logoPath!,
                                      height: 60.h,
                                      width: 120.w,
                                    )
                                  : Container(
                                      // alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 10),
                                        child: Text(
                                          widget.movieModel
                                              .productionCompanies[index].name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(30),
          BlocBuilder(
            bloc: widget.videosCubit,
            builder: (context, state) {
            if (state is ShowVideosLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.videosCubit.trailererVideos.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Movie Trailers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        verticalSpace(16),
                        CustomVideoViewWidget(
                          videoImage: widget.movieModel.backdropPath,
                          cubit: widget.videosCubit,
                        ),
                        verticalSpace(16),
                      ],
                    ),
                  if (widget.videosCubit.featuretteVideos.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Movie Featurettes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        verticalSpace(16),
                        CustomVideoViewWidget(
                          isTrailer: false,
                          videoImage: widget.movieModel.backdropPath,
                          cubit: widget.videosCubit,
                        ),
                        verticalSpace(16),
                      ],
                    ),
                ]);
          })
        ],
      ),
    );
  }
}
