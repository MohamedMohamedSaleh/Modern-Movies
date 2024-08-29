import 'package:flutter/material.dart';
import 'package:modern_movies/core/helpers/methods.dart';

class CustomVideoViewWidget extends StatelessWidget {
  const CustomVideoViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Container(),
        separatorBuilder: (context, index) => horizontalSpace(20),
        itemCount: 2);
  }
}

class _CustomVideoItem extends StatefulWidget {
  const _CustomVideoItem();

  @override
  State<_CustomVideoItem> createState() => _CustomVideoItemState();
}

class _CustomVideoItemState extends State<_CustomVideoItem> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}