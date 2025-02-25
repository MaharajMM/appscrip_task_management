import 'package:appscrip_task_management/app/view/app.dart';
import 'package:appscrip_task_management/bootstrap.dart';
import 'package:appscrip_task_management/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class Splasher extends StatelessWidget {
  const Splasher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashView(
        removeSpalshLoader: false,
        onInitialized: (container) {
          bootstrap(
            () => const App(),
            parent: container,
          );
        },
      ),
    );
  }
}
