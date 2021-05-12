import 'package:flutter/material.dart';
import 'src/disease_list.dart';
import 'src/about_page.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Catálogo de enfermedades (CIE10)';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: DiseaseList(),
      routes:  {
        Routes.home: (context) => DiseaseList(),
        Routes.about: (context) => AboutPage(),
      },
    );
  }
}

