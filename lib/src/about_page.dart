import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = 'about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acerca de la aplicación"),
      ),
      drawer: AppDrawer(),
      body: Center(

      ),
    );
  }
}