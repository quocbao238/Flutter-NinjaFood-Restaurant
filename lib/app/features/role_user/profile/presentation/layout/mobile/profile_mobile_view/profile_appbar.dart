part of 'profile_mobile_view.dart';

class ProfileAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minExtentHeight;
  final Widget title;
  final Widget backgroundImage;

  ProfileAppBar(
      {required this.minExtentHeight,
      required this.expandedHeight,
      required this.title,
      required this.backgroundImage});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage,
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.7)]))),
          Positioned(top: 0, left: 0, child: title)
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minExtentHeight;

  @override
  bool shouldRebuild(covariant ProfileAppBar oldDelegate) => expandedHeight != oldDelegate.expandedHeight;
}
