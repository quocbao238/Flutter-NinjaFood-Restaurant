import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'example_controller.dart';
import 'state/example_state.dart';

final exampleProvider =
    StateNotifierProvider<ExampleController, ExampleState>((ref) {
  return ExampleController(container: ref.container);
});