part of core_widget;

class AppEmailAsset {
  static const email = 'assets/icons/email_icon.svg';
  static const password = 'assets/icons/password_icon.svg';
  static const userProfile = 'assets/icons/password_icon.svg';
  static const checkbox = 'assets/icons/user_profile_icon.svg';

  static const unCheckbox = 'assets/icons/checkbox_icon.svg';
  static const facebook = 'assets/icons/facebook_icon.svg';
  static const google = 'assets/icons/google_icon.svg';
  static const gallery = 'assets/icons/gallery_icon.svg';
  static const camera = 'assets/icons/camera_icon.svg';
  static const yourLocaltion = 'assets/icons/your_location.svg';
  static const viaEmail = 'assets/icons/via_email_icon.svg';
  static const viaSMS = 'assets/icons/via_sms_icon.svg';

  static const menuHome = 'assets/icons/menu_home_icon.svg';
  static const menuUser = 'assets/icons/menu_user_icon.svg';
  static const menuCart = 'assets/icons/menu_cart_icon.svg';
  static const menuChat = 'assets/icons/menu_chat_icon.svg';

  static const notification = 'assets/icons/notification_icon.svg';
  static const search = 'assets/icons/search_icon.svg';
  static const filter = 'assets/icons/filter_icon.svg';
  static const sendMessage = 'assets/icons/send_message_icon.svg.svg';
  static const volumeOn = 'assets/icons/volume_on.svg';
  static const volumeOff = 'assets/icons/volumeOff.svg';
  static const edit = 'assets/icons/edit_icon.svg';
  static const locationMap = 'assets/icons/location_icon.svg';
  static const heart = 'assets/icons/heart_icon.svg';
}

enum AppIcon {
  email(AppEmailAsset.email),
  password(AppEmailAsset.password),
  userProfile(AppEmailAsset.userProfile),

  checkbox(AppEmailAsset.checkbox),
  unCheckbox(AppEmailAsset.unCheckbox),

  facebook(AppEmailAsset.facebook),
  google(AppEmailAsset.google),
  gallery(AppEmailAsset.gallery),
  camera(AppEmailAsset.camera),
  yourLocaltion(AppEmailAsset.yourLocaltion),
  viaEmail(AppEmailAsset.viaEmail),
  viaSMS(AppEmailAsset.viaSMS),
  menuHome(AppEmailAsset.menuHome),
  menuUser(AppEmailAsset.menuUser),
  menuCart(AppEmailAsset.menuCart),
  menuChat(AppEmailAsset.menuChat),
  notification(AppEmailAsset.notification),
  search(AppEmailAsset.search),
  filter(AppEmailAsset.filter),
  sendMessage(AppEmailAsset.sendMessage),
  volumeOn(AppEmailAsset.volumeOn),
  volumeOff(AppEmailAsset.volumeOff),
  edit(AppEmailAsset.edit),
  locationMap(AppEmailAsset.locationMap),
  heart(AppEmailAsset.heart);

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

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      appIcon.url,
    );
  }
}
