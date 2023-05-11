import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/role_admin/tabs/controllers/admin_tabs_controller.dart';
import 'package:ninjafood/app/models/menu_models.dart';
import 'package:ninjafood/app/features/role_user/tabs/presentation/layout/mobile/drawer_mobile_view/drawer_mobile_view.dart';
part 'admin_drawer_mobile_item_widget.dart';
part 'admin_drawer_mobile_list_widget.dart';

class AdminDrawerMobileView extends StatelessWidget {
  const AdminDrawerMobileView({Key? key}) : super(key: key);

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
                Expanded(child: AdminDrawerListWidget())
              ]),
        ),
      ),
    );
  }
}
