import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class NumeratorScreen extends ConsumerWidget {



  const NumeratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

final clickNumerator = ref.watch(numeratorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Numerator Screen'),
      ),
      body: Center(
        child: Text('Valor: $clickNumerator', style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(numeratorProvider.notifier).state++;
          //ref.read(numeratorProvider.notifier).update(
           // (state) => state + 1
          //);

      },
      child: Icon(Icons.add),
      ) ,
    );
  }
}
