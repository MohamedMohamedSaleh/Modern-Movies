import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/features/data/show_movie_data.dart';
import 'package:modern_movies/views/screens/movies_details/models/images_view_model.dart';
import 'package:modern_movies/views/screens/movies_details/models/vote_count_model.dart';
import 'package:modern_movies/views/screens/movies_details/widgets/custom_images_view_widget.dart';
import 'package:modern_movies/views/widgets/app_image.dart';

import '../../../../core/helpers/methods.dart';
import 'custom_trailer_view_widget.dart';
import 'custom_vote_count_widget.dart';

class CustomDetailsWidget extends StatelessWidget {
  final ShowMovieData movieModel;

  const CustomDetailsWidget({
    super.key,
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImagesViewWidget(
            model: MovieImagesModel(
                backdropPath: movieModel.backdropPath,
                image: movieModel.posterPath,
                date: movieModel.releaseDate,
                status: movieModel.status,
                title: movieModel.title),
          ),
          CustomVoteCountWidget(
            model: VoteCountModel(
                popularity: movieModel.popularity,
                voteCount: movieModel.voteCount,
                rate: movieModel.voteAverage),
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
                      movieModel.overview,
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
                            movieModel.genres.length,
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
                                        movieModel.genres[index].name,
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
                            movieModel.productionCompanies.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: movieModel.productionCompanies[index]
                                          .logoPath?.isNotEmpty ??
                                      false
                                  ? AppImage(
                                      movieModel
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
                                          movieModel
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Movie trailer',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          verticalSpace(16),
          const CustomVideoViewWidget(),
        ],
      ),
    );
  }
}
