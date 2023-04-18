import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/infrastructure/models/menu_models.dart';
import 'package:ninjafood/app/controllers/controllers.dart';

part 'drawer_mobile_header_widget.dart';

part 'drawer_mobile_item_widget.dart';

part 'drawer_mobile_list_widget.dart';

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppSizeScale(
        child: AppPadding(
          padding: AppEdgeInsets.only(left: AppGapSize.medium, top: AppGapSize.medium, bottom: AppGapSize.medium),
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
