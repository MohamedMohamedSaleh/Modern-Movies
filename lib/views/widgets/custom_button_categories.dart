import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/core/helpers/methods.dart';

class CustomButtonCategories extends StatefulWidget {
  const CustomButtonCategories({super.key});

  @override
  State<CustomButtonCategories> createState() => _CustomButtonCategoriesState();
}

class _CustomButtonCategoriesState extends State<CustomButtonCategories> {
  int selectedIndex = 0;
  final List<String> categories = ['All', 'Action', 'Comedy', 'Drama'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
          padding: const EdgeInsets.only(left: 16, right: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: selectedIndex == index
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 6),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                              fontSize: 16.sp,
                              color:
                                  selectedIndex == index ? Colors.white : null,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
          separatorBuilder: (context, index) => horizontalSpace(10.w),
          itemCount: categories.length),
    );
  }
}
