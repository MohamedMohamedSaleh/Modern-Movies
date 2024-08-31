import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:modern_movies/features/get_movie/get_movie_cubit.dart';
import 'package:modern_movies/features/show_videos/show_videos_cubit.dart';
import 'package:modern_movies/views/screens/movies_details/widgets/custom_characters_widget.dart';
import 'package:modern_movies/views/widgets/custom_icon.dart';

import 'widgets/custom_details_widget.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key, required this.id, required this.image});
  final int id;
  final String image;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  final showMovieCubit = KiwiContainer().resolve<GetMovieCubit>();
  final showVideosCubit = KiwiContainer().resolve<ShowVideosCubit>();
  @override
  void initState() {
    showVideosCubit.showVideos(id: widget.id);
    showMovieCubit.getMovie(id: widget.id);
    super.initState();
  }

  @override
  void dispose() {
    showMovieCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.h,
          title: const Text('Movie'),
          actions: [
            CustomIcon(
              icon: const Icon(Icons.search),
              onTap: () {},
            ),
            horizontalSpace(16),
          ],
          bottom: TabBar(
              dividerHeight: 0,
              unselectedLabelStyle:
                  TextStyle(fontSize: 14, color: Colors.grey[600]),
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
              tabs: const [
                Tab(
                  text: "Details",
                ),
                Tab(
                  text: "Character",
                ),
              ]),
        ),
        body: BlocBuilder(
          bloc: showMovieCubit,
          builder: (context, state) {
            return TabBarView(
              children: [
                (state is GetMovieLoading)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state is GetMovieSuccess
                        ? CustomDetailsWidget(
                          videosCubit: showVideosCubit,
                            movieModel: state.movieData,
                          )
                        : Center(
                            child: Text("Something went wrong",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                const CustomCharactersWidget()
              ],
            );
          },
        ),
      ),
    );
  }
}
