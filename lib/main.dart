import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/utils/theme/theme.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Init Payment Methods
  // Todo: Await Native Splash
  // Todo: Initialize Firebase

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Todo: Initialize Authentication

  // Load all the Material Design / Themes / Localizations / Bindings

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
