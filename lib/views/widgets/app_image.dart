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
    this.errorImage,
  });
  final String path;
  final double? height, width;
  final BoxFit fit;
  final Color? color;
  final String? errorImage;

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
        errorWidget: (context, url, error) {
          if (error.toString().contains('404')) {
            return CachedNetworkImage(
              height: height?.h,
              width: width?.w,
              fit: fit,
              imageUrl: errorImage ??
                  'https://thumbs.dreamstime.com/b/word-video-white-plastic-letters-black-notice-board-bulletin-141316285.jpg',
            );
          }
          return Icon(
            Icons.error,
            size: 50,
            color: Colors.red[700],
          );
        },
        height: height?.h,
        width: width?.w,
        fit: fit,
        color: color,
      );
//https://img.favpng.com/2/24/17/youtube-social-media-computer-icons-video-logo-png-favpng-vRZJzfnQu6ryhdSCJ0PvnkkC7.jpg
//https://thumbs.dreamstime.com/b/word-video-white-plastic-letters-black-notice-board-bulletin-141316285.jpg
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
