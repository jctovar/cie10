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
      body: Column (
        children: [
          Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                  children: [
                    Image.asset('assets/image_28.jpg'),
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: const Text('Card title 1'),
                      subtitle: Text(
                        'Secondary Text',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ]
              )
          )
        ],
      ),
    );
  }
}