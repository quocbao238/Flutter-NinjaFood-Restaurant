import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/favorite_list_widget.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/history_list_widget.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/profile_body_user_info_widget.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/widgets/voucher_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppSizeScale(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: AppPadding.medium(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ProfileUserInformationWidget(), VoucherWidget(), FavoriteList(), HistoryList()],
          ),
        ),
      ),
    );
  }
}
