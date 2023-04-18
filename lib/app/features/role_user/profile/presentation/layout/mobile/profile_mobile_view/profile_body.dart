part of 'profile_mobile_view.dart';

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
            children: [
              ProfileUserInformationWidget(),
              ProfileVoucherWidget(),
              FavoriteList(),
              HistoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
