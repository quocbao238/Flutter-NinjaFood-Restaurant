import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';






class AnimationList extends StatelessWidget {
  final ScrollController? controller;
  final Widget Function(
      BuildContext context, int index, Animation<double> animation) itemBuilder;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final Axis? scrollDirection;

  const AnimationList(
      {Key? key,
      this.controller,
      required this.itemBuilder,
      required this.itemCount,
      this.scrollDirection = Axis.vertical,
      this.physics,
      required this.shrinkWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiveList.options(
      scrollDirection: scrollDirection!,
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
    );
  }
}

class AnimationItem extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const AnimationItem({Key? key, required this.animation, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
