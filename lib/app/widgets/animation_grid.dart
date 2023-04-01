import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class AnimationGridView extends StatelessWidget {
  final ScrollController? controller;
  final Widget Function(
      BuildContext context, int index, Animation<double> animation) itemBuilder;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final Axis? scrollDirection;
  final SliverGridDelegate gridDelegate;
  final EdgeInsetsGeometry? padding;

  const AnimationGridView(
      {Key? key,
      this.controller,
      required this.itemBuilder,
      required this.itemCount,
      this.scrollDirection = Axis.vertical,
      this.physics,
      this.shrinkWrap,
      required this.gridDelegate,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiveGrid.options(
      scrollDirection: scrollDirection!,
      padding: padding,
      options: LiveOptions(
          delay: Duration(milliseconds: 200),
          showItemInterval: Duration(milliseconds: 100),
          showItemDuration: Duration(milliseconds: 200),
          visibleFraction: 0.05,
          reAnimateOnVisibility: false),
      shrinkWrap: shrinkWrap ?? false,
      physics: physics ?? NeverScrollableScrollPhysics(),
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      gridDelegate: gridDelegate,
    );
  }
}
