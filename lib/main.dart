import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/core/services/shared_pref.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPref.init();
  setupGetit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: "Cairo",
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
      locale: Locale("ar"),
      supportedLocales: [
        Locale("ar"),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}
