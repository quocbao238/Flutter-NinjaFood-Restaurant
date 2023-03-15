import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class AppScaffoldBackgroundImage extends AppScaffold {
  const AppScaffoldBackgroundImage({super.key, required super.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover)),
      child: body,
    ));
  }
}
