import 'package:flutter/material.dart';
import 'package:pos/button_listener.dart';
import 'package:pos/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CustomButtonListener.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
      onGenerateRoute: (route) => onGenerateRoute(route),
    );
  }
}