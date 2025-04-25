import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:top4job/features/on_boarding_screens/on_boarding_screens_view.dart';

import 'core/routing/page_router.dart' show navigatorKey;
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await findSystemLocale();
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top4Job',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      navigatorKey: navigatorKey,
      home: OnBoardingScreensPage(),
    );
  }
}
