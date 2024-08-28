import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:modern_movies/features/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:modern_movies/views/widgets/custom_button_categories.dart';
import 'package:modern_movies/views/widgets/custom_horizontal_movies.dart';
import 'package:modern_movies/views/widgets/custom_loading_gridview.dart';
import 'package:modern_movies/views/widgets/item_grid.dart';

import '../../features/get_all_movies/get_all_movies_cubit.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_loading_listview.dart';
import '../widgets/custom_loading_widget.dart';
import '../widgets/item_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final popularCubit = KiwiContainer().resolve<GetPopularMoviesCubit>();
  final allMoviesCubit = KiwiContainer().resolve<GetAllMoviesCubit>();
  late final ScrollController _scrollHorizontalController;
  late final ScrollController _scrollVerticalController;
  bool isGrid = false;
  bool isLoading = false;

  Future<void> loadAllMovies() async {
    var currentPosition = _scrollVerticalController.position.pixels;
    var maxScrollExtent = _scrollVerticalController.position.maxScrollExtent;

    if (currentPosition >= 0.95 * maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await allMoviesCubit.getAllMovies(fromPagination: true);
        await Future.delayed(const Duration(seconds: 2));
        isLoading = false;
      }
    }
  }

  Future<void> loadPopularMovies() async {
    var currentPosition = _scrollHorizontalController.position.pixels;
    var maxScrollExtent = _scrollHorizontalController.position.maxScrollExtent;

    if (currentPosition >= 0.90 * maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await popularCubit.getPopularMovies(fromPagination: true);
        await Future.delayed(const Duration(seconds: 2));
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollVerticalController.dispose();
    _scrollHorizontalController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollVerticalController = ScrollController();
    _scrollVerticalController.addListener(loadAllMovies);
    _scrollHorizontalController = ScrollController();
    _scrollHorizontalController.addListener(loadPopularMovies);
    super.initState();
  }

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
      body: SafeArea(
        child: ListView(
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
                bloc: popularCubit,
                builder: (context, state) {
                  if (state is GetPopularMoviesLoading) {
                    return SizedBox(
                      height: 180.h,
                      child: ListView.separated(
                        padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const CustomLoadingWidget(
                          radius: 15,
                        ),
                        separatorBuilder: (context, index) =>
                            horizontalSpace(16),
                        itemCount: 10,
                      ),
                    );
                  } else if (state is GetPopularMoviesFailure) {
                    return Text(state.message);
                  }
                  return SizedBox(
                    height: 180.h,
                    child: ListView.separated(
                      controller: _scrollHorizontalController,
                      padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CustomHorizontalMovies(
                        model: popularCubit.popularMovies[index],
                      ),
                      separatorBuilder: (context, index) => horizontalSpace(16),
                      itemCount: popularCubit.popularMovies.length,
                    ),
                  );
                }),
            verticalSpace(8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
              child: Text("Categories",
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            const CustomButtonsCategories(),
            verticalSpace(8),
            StatefulBuilder(builder: (context, setState1) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30.h,
                          child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "All Movies",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                horizontalSpace(3),
                                Icon(
                                  Icons.double_arrow_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        horizontalSpace(16),
                        InkWell(
                            radius: 10,
                            // splashFactory: InkSplash.splashFactory,
                            onTap: () {
                              setState1(() {
                                isGrid = !isGrid;
                              });
                            },
                            child: CustomIcon(
                                icon: isGrid
                                    ? const Icon(Icons.list_rounded)
                                    : const Icon(Icons.grid_view_outlined))),
                        horizontalSpace(16),
                      ],
                    ),
                  ),
                  BlocBuilder(
                    bloc: allMoviesCubit,
                    builder: (context, state) {
                      if (state is GetAllMoviesLoading) {
                        return isGrid
                            ? const CustomLoadingGridView()
                            : const CustomLoadingListView();
                      }
                      return !isGrid
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(15),
                              itemBuilder: (context, index) =>
                                  CustomListViewItem(
                                      model: allMoviesCubit.allMovies[index],
                                      index: index),
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 16,
                                );
                              },
                              itemCount: allMoviesCubit.allMovies.length,
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(15),
                              itemCount: allMoviesCubit.allMovies.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: .62,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16),
                              itemBuilder: (context, index) => CustomGridView(
                                  model: allMoviesCubit.allMovies[index],
                                  index: index),
                            );
                    },
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
