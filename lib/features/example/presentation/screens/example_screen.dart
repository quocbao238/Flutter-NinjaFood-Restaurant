
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ninjafood/features/example/application/example_provider.dart';
import 'package:ninjafood/features/example/application/state/example_state.dart';
import 'package:ninjafood/features/onboard/presentation/onboard_screen.dart';

class ExampleScreen extends ConsumerWidget {
  static const String route = 'example';
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   final state =  ref.watch(exampleProvider); 
    final data = state.data;
    _onListen(ref,context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ExampleScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Current Example Int Value: ${data.exampleInt.toString()}"),
            ),
            TextButton(
              onPressed: () =>
                    ref.read(exampleProvider.notifier).onPressedButton(),
          
  
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Go To Onboard Screen"),
             ))
          ],
        ) ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
              ref.read(exampleProvider.notifier).onPressedFloatActionButton((data.exampleInt?? 0) + 1)
  
      )
    );
  }



  _onListen(WidgetRef ref,BuildContext context){
      ref.listen(exampleProvider, (_, currentState) { 
        if(currentState is OnPressedButtonState){
          print("Go To Onboard Screen");
          context.goNamed(
            OnboardScreen.route,
          );
          
          // ...
        }
      });
  }
}