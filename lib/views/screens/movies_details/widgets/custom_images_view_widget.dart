import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/views/screens/movies_details/models/images_view_model.dart';

import '../../../../core/helpers/methods.dart';
import '../../../widgets/app_image.dart';

class CustomImagesViewWidget extends StatelessWidget {
  final MovieImagesModel model;
  const CustomImagesViewWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).appBarTheme.backgroundColor!.withOpacity(0.4),
                Theme.of(context).appBarTheme.backgroundColor!.withOpacity(.5),
                Theme.of(context).appBarTheme.backgroundColor!.withOpacity(.8),
                Theme.of(context).appBarTheme.backgroundColor!.withOpacity(.8),
                Theme.of(context).appBarTheme.backgroundColor!.withOpacity(.9),
                Theme.of(context).appBarTheme.backgroundColor!.withOpacity(.96),
                Theme.of(context)
                    .appBarTheme
                    .backgroundColor!
                    .withOpacity(.999),
              ],
            )),
            child: AppImage(
              model.backdropPath,
              height: 220.h,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  horizontalSpace(16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AppImage(
                      model.image,
                      height: 200,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  horizontalSpace(20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                          // verticalSpace(4),
                          Text(
                            model.status,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                          ),

                          Text(
                            model.date,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
