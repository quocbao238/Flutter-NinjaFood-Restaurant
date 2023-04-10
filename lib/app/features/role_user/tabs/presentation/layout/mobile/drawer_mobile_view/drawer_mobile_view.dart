import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

import 'widgets/drawer_widget.dart';

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppSizeScale(
        child: AppPadding(
          padding: AppEdgeInsets.only(
            left: AppGapSize.medium,
            top: AppGapSize.medium,
            bottom: AppGapSize.medium,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DrawerHeaderWidget(),
                AppSizeScale(
                    ratioWidth: 0.5, child: Divider(color: Theme.of(context).colorScheme.primary, thickness: 1)),
                Expanded(child: DrawerListWidget())
              ]),
        ),
      ),
    );
  }
}
