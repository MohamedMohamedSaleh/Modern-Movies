import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:modern_movies/views/widgets/app_image.dart';
import 'package:modern_movies/views/widgets/custom_icon.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
        actions: [
          CustomIcon(
            icon: const Icon(Icons.search),
            onTap: () {},
          ),
          horizontalSpace(16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
                        Theme.of(context)
                            .appBarTheme
                            .backgroundColor!
                            .withOpacity(0.4),
                        Theme.of(context)
                            .appBarTheme
                            .backgroundColor!
                            .withOpacity(.5),
                        Theme.of(context)
                            .appBarTheme
                            .backgroundColor!
                            .withOpacity(.8),
                        Theme.of(context)
                            .appBarTheme
                            .backgroundColor!
                            .withOpacity(.8),
                        Theme.of(context)
                            .appBarTheme
                            .backgroundColor!
                            .withOpacity(.9),
                        Theme.of(context)
                            .appBarTheme
                            .backgroundColor!
                            .withOpacity(.96),
                        Theme.of(context)
                            .appBarTheme
                            .backgroundColor!
                            .withOpacity(.999),
                      ],
                    )),
                    child: const AppImage(
                        'https://img.freepik.com/free-photo/beautiful-anime-character-cartoon-scene_23-2151035155.jpg'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          horizontalSpace(16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const AppImage(
                              'https://img.freepik.com/free-photo/anime-style-character-with-fire_23-2151152455.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1724803200&semt=ais_hybrid',
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
                                    'Title' * 20,
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
                                    'released',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                  ),

                                  Text(
                                    '2022/12/12',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 18,
                      // offset: const Offset(3, 10),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "8.45",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "/10",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "vote count",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "86522662",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'popularity',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "5565561656",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.04),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    )
                  ],
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      "model.overviewrelease date: model.releaseDate" * 4,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(10),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        ...List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 5),
                                child: Text('data'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            verticalSpace(10),
            SizedBox(
              height: 130.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    5,
                    (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                            ),
                            verticalSpace(4),
                            const Text('data'),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            verticalSpace(30)
          ],
        ),
      ),
    );
  }
}
