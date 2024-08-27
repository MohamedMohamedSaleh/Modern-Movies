import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:modern_movies/features/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:modern_movies/views/widgets/custom_button_categories.dart';
import 'package:modern_movies/views/widgets/custom_horizontal_movies.dart';

import '../widgets/custom_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = KiwiContainer().resolve<GetPopularMoviesCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modern Movies'),
        actions: [
          InkWell(
            onTap: () {},
            child: const CustomIcon(
              icon: Icon(Icons.search),
            ),
          ),
          horizontalSpace(16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Popular Movies",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            verticalSpace(16),
            BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is GetPopularMoviesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetPopularMoviesFailure) {
                    return Text(state.message);
                  }
                  return SizedBox(
                    height: 180.h,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CustomHorizontalMovies(
                        model: cubit.popularMovies[index],
                      ),
                      separatorBuilder: (context, index) => horizontalSpace(16),
                      itemCount: cubit.popularMovies.length,
                    ),
                  );
                }),
            verticalSpace(8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Text("Categories",
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            const CustomButtonCategories(),
            // notificationListener(
            //   ListView.separated(
            //     padding: const EdgeInsets.all(15),
            //     itemBuilder: (context, index) => CustomListViewItem(
            //         model: cubit.popularMovies[index], index: index),
            //     separatorBuilder: (context, index) {
            //       return const Column(
            //         children: [
            //           SizedBox(
            //             height: 16,
            //           ),
            //         ],
            //       );
            //     },
            //     itemCount: cubit.popularMovies.length,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
