import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class ContactPage extends StatelessWidget {
  static const String routeName = 'contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reportar error"),
      ),
      drawer: AppDrawer(),
      body: Center(
      ),
    );
  }
}