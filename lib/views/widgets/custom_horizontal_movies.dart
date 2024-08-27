import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/features/data/movies_model.dart';
import 'package:modern_movies/views/widgets/app_image.dart';

class CustomHorizontalMovies extends StatelessWidget {
  const CustomHorizontalMovies({super.key, required this.model});
  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160.h,
          width: 115.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 7,
                offset: const Offset(5, 12),
              )
            ],
          ),
          child: AppImage(
            model.posterPath,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
