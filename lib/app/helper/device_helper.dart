part of 'helper.dart';

enum DeviceType { tablet, mobile }

class DeviceHelper {
  static DeviceType deviceType = DeviceType.mobile;
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static ui.Size size = ui.window.physicalSize;
  static init() {
    double width = size.longestSide;
    double height = size.shortestSide;
    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      return deviceType = DeviceType.tablet;
    }
    if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      return deviceType = DeviceType.tablet;
    }
  }
}
