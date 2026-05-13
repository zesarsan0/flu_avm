import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/presentation/providers/providers.dart';
import 'package:flutter_application_1/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
    child: MainApp(),
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final tenebrisModusEst = ref.watch(estTenebrisModusProvider);
   
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        tenebrisModusEts: tenebrisModusEst,
        electusColor: Colors.pink.shade900
        ).getTheme(),
      );
  }
}
