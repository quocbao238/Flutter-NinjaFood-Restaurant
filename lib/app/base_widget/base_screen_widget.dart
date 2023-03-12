part of 'base_widget.dart';

class BaseViewLayout extends StatelessWidget {
  final Widget? mobileView;
  final Widget? tabletView;
  const BaseViewLayout({super.key, this.mobileView, this.tabletView});

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceHelper.deviceType;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        if (deviceType == DeviceType.mobile) {
          return mobileView ??
              BaseErrorWidget(message: 'Layout Mobile Not Found');
        }
        return tabletView ??
            BaseErrorWidget(message: 'Layout Tablet Not Found');
      }),
    );
  }
}
