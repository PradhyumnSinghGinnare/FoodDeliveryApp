import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/services/auth/auth_gate.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:food_delivery_app/web/web_layout.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        //Theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //Restaurant Provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: WebLayout(child: AuthGate()),
    );
  }
}
