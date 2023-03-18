part of core_widget;

class AppViewLayout extends StatelessWidget {
  final Widget? mobileView;
  final Widget? tabletView;
  const AppViewLayout({super.key, this.mobileView, this.tabletView});

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceHelper.deviceType;

    if (deviceType == DeviceType.mobile) {
      return mobileView ?? AppErrorWidget(message: 'Layout Mobile Not Found');
    }
    return tabletView ?? AppErrorWidget(message: 'Layout Tablet Not Found');
  }
}
