import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/set_location/presentation/layout/mobile/set_location_mobile_view.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SetLocationMobileView(),
    );
  }
}
