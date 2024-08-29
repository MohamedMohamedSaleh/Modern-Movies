import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/methods.dart';

class CustomCharactersWidget extends StatefulWidget {
  const CustomCharactersWidget({super.key});

  @override
  State<CustomCharactersWidget> createState() => _CustomCharactersWidgetState();
}

class _CustomCharactersWidgetState extends State<CustomCharactersWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
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
      ],),
    );
  }
}