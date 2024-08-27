import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:modern_movies/features/get_popular_movies/get_popular_movies_cubit.dart';


Widget notificationListener(Widget child) {
  return Builder(
    builder: (context) => NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent &&
            notification is ScrollUpdateNotification) {
          final cubit = KiwiContainer().resolve<GetPopularMoviesCubit>();
          cubit.getPopularMovies(fromPagination: true);
        }
        return true;
      },
      child: child,
    ),
  );
}
