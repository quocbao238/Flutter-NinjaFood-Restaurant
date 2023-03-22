part of core_widget;

enum AppIcon {
  email(AppIconsAssets.email),
  password(AppIconsAssets.password),
  userProfile(AppIconsAssets.userProfile),

  checkbox(AppIconsAssets.checkbox),
  unCheckbox(AppIconsAssets.unCheckbox),

  facebook(AppIconsAssets.facebook),
  google(AppIconsAssets.google),
  gallery(AppIconsAssets.gallery),
  camera(AppIconsAssets.camera),
  yourLocaltion(AppIconsAssets.yourLocaltion),
  viaEmail(AppIconsAssets.viaEmail),
  viaSMS(AppIconsAssets.viaSMS),
  menuHome(AppIconsAssets.menuHome),
  menuUser(AppIconsAssets.menuUser),
  menuCart(AppIconsAssets.menuCart),
  menuChat(AppIconsAssets.menuChat),
  notification(AppIconsAssets.notification),
  search(AppIconsAssets.search),
  filter(AppIconsAssets.filter),
  sendMessage(AppIconsAssets.sendMessage),
  volumeOn(AppIconsAssets.volumeOn),
  volumeOff(AppIconsAssets.volumeOff),
  edit(AppIconsAssets.edit),
  locationMap(AppIconsAssets.locationMap),
  heart(AppIconsAssets.heart),
  close(AppIconsAssets.close),

  back(AppIconsAssets.back);

  final String url;
  const AppIcon(this.url);
}

class AppIcons extends StatelessWidget {
  final AppIcon appIcon;
  const AppIcons({super.key, required this.appIcon});
  const AppIcons.email({super.key, this.appIcon = AppIcon.email});
  const AppIcons.password({super.key, this.appIcon = AppIcon.password});
  const AppIcons.userProfile({super.key, this.appIcon = AppIcon.userProfile});
  const AppIcons.checkbox({super.key, this.appIcon = AppIcon.checkbox});
  const AppIcons.unCheckbox({super.key, this.appIcon = AppIcon.unCheckbox});
  const AppIcons.facebook({super.key, this.appIcon = AppIcon.facebook});
  const AppIcons.google({super.key, this.appIcon = AppIcon.google});
  const AppIcons.gallery({super.key, this.appIcon = AppIcon.gallery});
  const AppIcons.camera({super.key, this.appIcon = AppIcon.camera});
  const AppIcons.yourLocaltion(
      {super.key, this.appIcon = AppIcon.yourLocaltion});
  const AppIcons.viaEmail({super.key, this.appIcon = AppIcon.viaEmail});
  const AppIcons.viaSMS({super.key, this.appIcon = AppIcon.viaSMS});
  const AppIcons.menuHome({super.key, this.appIcon = AppIcon.menuHome});
  const AppIcons.menuUser({super.key, this.appIcon = AppIcon.menuUser});
  const AppIcons.menuCart({super.key, this.appIcon = AppIcon.menuCart});
  const AppIcons.menuChat({super.key, this.appIcon = AppIcon.menuChat});
  const AppIcons.notification({super.key, this.appIcon = AppIcon.notification});
  const AppIcons.search({super.key, this.appIcon = AppIcon.search});
  const AppIcons.filter({super.key, this.appIcon = AppIcon.filter});
  const AppIcons.sendMessage({super.key, this.appIcon = AppIcon.sendMessage});
  const AppIcons.volumeOn({super.key, this.appIcon = AppIcon.volumeOn});
  const AppIcons.volumeOff({super.key, this.appIcon = AppIcon.volumeOff});
  const AppIcons.edit({super.key, this.appIcon = AppIcon.edit});
  const AppIcons.heart({super.key, this.appIcon = AppIcon.heart});
  const AppIcons.back({super.key, this.appIcon = AppIcon.back});
  const AppIcons.close({super.key, this.appIcon = AppIcon.close});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      appIcon.url,
    );
  }
}
