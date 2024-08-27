import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.scaleDown,
    this.color,
  });
  final String path;
  final double? height, width;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
   if (path.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: path,
        placeholder: (context, url) => FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Loading...',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[400],
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red[700],
                  ),
        height: height?.h,
        width: width?.w,
        fit: fit,
        color: color,
      );

      /*  return Image.network(
        path,
        height: height?.h,
        width: width?.w,
        fit: fit,
        color: color,
      ); */
    } else {
      return Image.asset(
        path,
        height: height?.h,
        width: width?.w,
        fit: fit,
        color: color,
      );
    }
  }
}
