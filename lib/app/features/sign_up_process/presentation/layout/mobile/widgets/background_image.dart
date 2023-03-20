// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ninjafood/app/core/core.dart';
// import 'package:ninjafood/app/services/theme/theme_service.dart';
// import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

// class BackgroundImage extends AppScaffold {
//   const BackgroundImage({
//     super.key,
//     required super.body,
//     super.isLoading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     ThemeService controller = Get.find<ThemeService>();
//     return Scaffold(
//       body: DecoratedBox(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(AppImageAssets.backgroundPattern),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
