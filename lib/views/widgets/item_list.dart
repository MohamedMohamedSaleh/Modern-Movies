import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/core/helpers/extentions.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:modern_movies/views/widgets/app_image.dart';

import '../../features/data/movies_model.dart';
import '../screens/movies_details/movie_details_views.dart';

class CustomListViewItem extends StatefulWidget {
  final MovieModel model;
  final int index;
  const CustomListViewItem(
      {super.key, required this.model, required this.index});

  @override
  State<CustomListViewItem> createState() => _CustomListViewItemState();
}

class _CustomListViewItemState extends State<CustomListViewItem> {
  double width = 0;
  bool isAnimation = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isAnimation = true;
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        context.push( MovieDetailsView(
          id: widget.model.id,
          image: widget.model.posterPath,
        ));
      },
      child: AnimatedContainer(
        duration: Duration(
            milliseconds: widget.index <= 5 ? 400 + (widget.index * 250) : 300),
        curve: Curves.decelerate,
        transform: Matrix4.translationValues(isAnimation ? 0 : width, 0, 0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 10,
                offset: const Offset(3, 10))
          ],
          borderRadius: BorderRadius.circular(20).w,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Hero(
                tag: widget.model.id,
                child: AppImage(
                  widget.model.posterPath,
                  height: 130.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Text(
                        widget.model.title,
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Text(
                        widget.model.overview,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          horizontalSpace(5),
                          Text(
                            widget.model.voteAverage.toString(),
                          ),
                          horizontalSpace(5),
                          Text(
                            "(${widget.model.voteCount})",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
