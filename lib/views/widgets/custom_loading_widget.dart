import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadingWidget extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  const CustomLoadingWidget({
    super.key,
    this.height = 160,
    this.width = 120,
    this.radius = 9,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Text(
            'Loading',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[400]),
          ),
        ),
      ],
    );
  }
}
