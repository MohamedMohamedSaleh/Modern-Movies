import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:modern_movies/features/get_categories/get_categories_cubit.dart';
import 'package:modern_movies/views/widgets/custom_loading_widget.dart';

class CustomButtonsCategories extends StatefulWidget {
  const CustomButtonsCategories({super.key});

  @override
  State<CustomButtonsCategories> createState() =>
      _CustomButtonsCategoriesState();
}

class _CustomButtonsCategoriesState extends State<CustomButtonsCategories> {
  final cubit = KiwiContainer().resolve<GetCategoriesCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (state is GetCategoriesLoading) {
                return ListView.separated(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  itemBuilder: (context, index) => const CustomLoadingWidget(
                    height: 30,
                    width: 70,
                  ),
                  separatorBuilder: (context, index) => horizontalSpace(16),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                );
              }
              return ListView.separated(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => _CustomItem(
                        cubit: cubit,
                        index: index,
                      ),
                  separatorBuilder: (context, index) => horizontalSpace(10.w),
                  itemCount: cubit.categories.length);
            },
          ),
        );
      },
    );
  }
}

class _CustomItem extends StatelessWidget {
  final int index;

  const _CustomItem({
    required this.cubit,
    required this.index,
  });

  final GetCategoriesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
              child: Row(
                children: [
                  Text(
                    cubit.categories[index].name,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  horizontalSpace(3),
                  Icon(
                    Icons.double_arrow_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 18.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
