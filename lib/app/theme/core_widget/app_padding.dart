part of core_widget;

enum AppGapSize {
  none(0),
  small(ThemeSizes.small),
  medium(ThemeSizes.medium),
  regular(ThemeSizes.regular),
  large(ThemeSizes.large),
  verylarge(ThemeSizes.verylarge),
  customized(0);

  final double size;
  const AppGapSize(this.size);
}

enum AppPaddingType { all, horizontal, vertical, only, customized }

class AppEdgeInsets extends Equatable {
  final AppGapSize left;
  final AppGapSize top;
  final AppGapSize right;
  final AppGapSize bottom;

  const AppEdgeInsets.all(AppGapSize value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const AppEdgeInsets.symmetric({
    AppGapSize vertical = AppGapSize.none,
    AppGapSize horizontal = AppGapSize.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const AppEdgeInsets.only({
    this.left = AppGapSize.none,
    this.top = AppGapSize.none,
    this.right = AppGapSize.none,
    this.bottom = AppGapSize.none,
  });

  const AppEdgeInsets.small()
      : left = AppGapSize.small,
        top = AppGapSize.small,
        right = AppGapSize.small,
        bottom = AppGapSize.small;

  const AppEdgeInsets.medium()
      : left = AppGapSize.medium,
        top = AppGapSize.medium,
        right = AppGapSize.medium,
        bottom = AppGapSize.medium;

  const AppEdgeInsets.large()
      : left = AppGapSize.large,
        top = AppGapSize.large,
        right = AppGapSize.large,
        bottom = AppGapSize.large;

  const AppEdgeInsets.verylarge()
      : left = AppGapSize.verylarge,
        top = AppGapSize.verylarge,
        right = AppGapSize.verylarge,
        bottom = AppGapSize.verylarge;

  EdgeInsets toEdgeInsets() {
    return EdgeInsets.only(
        left: left.size, top: top.size, right: right.size, bottom: bottom.size);
  }

  @override
  List<Object?> get props => [
        left,
        top,
        right,
        bottom,
      ];
}

class AppPadding extends StatelessWidget {
  const AppPadding({
    Key? key,
    this.padding = const AppEdgeInsets.all(AppGapSize.none),
    this.child,
  }) : super(key: key);

  const AppPadding.small({
    Key? key,
    this.child,
    this.padding = const AppEdgeInsets.all(AppGapSize.small),
  }) : super(key: key);

  const AppPadding.medium({
    Key? key,
    this.child,
    this.padding = const AppEdgeInsets.all(AppGapSize.medium),
  }) : super(key: key);

  const AppPadding.regular({
    Key? key,
    this.child,
    this.padding = const AppEdgeInsets.all(AppGapSize.regular),
  }) : super(key: key);

  const AppPadding.large({
    Key? key,
    this.child,
    this.padding = const AppEdgeInsets.all(AppGapSize.large),
  }) : super(key: key);

  const AppPadding.verylarge({
    Key? key,
    this.child,
    this.padding = const AppEdgeInsets.all(AppGapSize.verylarge),
  }) : super(key: key);

  final AppEdgeInsets? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!.toEdgeInsets(),
      child: child,
    );
  }
}
