
import 'package:ninjafood/features/common/presentation/screens/error_screen.dart';
import 'package:ninjafood/features/common/presentation/utils/extensions/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ninjafood/features/example/presentation/screens/example_screen.dart';

import '../features/onboard/presentation/onboard_screen.dart';

/// Main router for the Example app
///
/// ! Pay attention to the order of routes.
/// Create:  example/create
/// View:    example/:eid
/// Edit:    example/:eid/edit
/// where :edit means example entity id.
///
/// ! Note about parameters
/// Router keeps parameters in global map. It means that if you create route
/// organization/:id and organization/:id/department/:id. Department id will
///  override organization id. So use :oid and :did instead of :id
/// Also router does not provide option to set regex for parameters.
/// If you put - example/:eid before - example/create for route - example/create
/// will be called route - example/:eid
///
///
final router = GoRouter(
  initialLocation: '/${ExampleScreen.route}',
  routes: [
    GoRoute(
          path: '/${ExampleScreen.route}',
          name: ExampleScreen.route,
          builder: (context, state) => const ExampleScreen(),
    ), GoRoute(
          path: '/${OnboardScreen.route}',
          name: OnboardScreen.route,
          builder: (context, state) => const OnboardScreen(),
    ),

  ],
  observers: [
    routeObserver
  ],
  errorBuilder: (context, state) =>
      ErrorScreen(message: context.tr.somethingWentWrong),
      debugLogDiagnostics: true

);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
