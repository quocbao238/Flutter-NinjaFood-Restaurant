


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninjafood/features/example/application/data/example_data.dart';

import 'state/example_state.dart';




class ExampleController extends StateNotifier<ExampleState> {
  final ProviderContainer container;
  ExampleController({required this.container}) : super(ExampleState.initState(data: ExampleData.empty()));

  void onPressedButton(){ 
    state = ExampleState.pressedButtonState(
      data: state.data
    );
  }

  void onPressedFloatActionButton(int value){
    final newData = updateData(exampleInt: value);
    state = state.copyWith(data: newData);
  }


  ExampleData updateData({
    String? exampleText,
    int ? exampleInt,
    double? exampleDouble,
    List<String>? listString
  })
     =>  state.data.copyWith(
    exampleDouble: exampleDouble ?? state.data.exampleDouble ,
    exampleInt: exampleInt ?? state.data.exampleInt ,
    exampleText: exampleText ?? state.data.exampleText ,
    listString: listString ?? state.data.listString,
     );
}