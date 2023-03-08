
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/example_data.dart';
part 'example_state.freezed.dart';

@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState.initState({required ExampleData data}) = InitState;
  const factory ExampleState.loadedState({required ExampleData data}) = LoadedState;
  const factory ExampleState.pressedButtonState({required ExampleData data}) = OnPressedButtonState
  ;
}
