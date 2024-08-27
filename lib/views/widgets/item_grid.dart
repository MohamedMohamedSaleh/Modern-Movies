import 'package:flutter/material.dart';
import 'package:modern_movies/views/widgets/app_image.dart';

import '../../features/data/movies_model.dart';

class CustomGridView extends StatefulWidget {
  final MovieModel model;
  final int index;
  final bool isSearch;
  const CustomGridView(
      {super.key,
      required this.model,
      required this.index,
      this.isSearch = false});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  double width = 0;
  bool isAnimation = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isAnimation = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {},
      child: AnimatedContainer(
        duration: Duration(
            milliseconds: widget.index <= 5 ? 400 + (widget.index * 250) : 300),
        curve: Curves.decelerate,
        transform: Matrix4.translationValues(isAnimation ? 0 : -width, 0, 100),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 10,
                offset: const Offset(3, 10))
          ],
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight:
                      Radius.circular(15)), // Adjust the radius as needed(15),
              child: Hero(
                tag: widget.model.id,
                child: AppImage(
                  widget.model.posterPath,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.model.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Text(
                widget.model.overview,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // const SizedBox(
            //   height: 17,
            // ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.model.voteAverage.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
