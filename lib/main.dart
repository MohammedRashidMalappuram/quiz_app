import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/views/screens/first_page.dart';
import 'package:quiz_app/controller/provider_.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderData(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: const FirstPage(),
      ),
    );
  }
}
