import 'package:ninjafood/app.dart';
import 'package:ninjafood/bootstrap.dart';
import 'package:ninjafood/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  F.appFlavor = Flavor.local;
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const MyApp(),
    ),
  );
}
