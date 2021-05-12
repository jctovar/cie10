import 'package:flutter/material.dart';
import '../models/disease_model.dart';

class DiseaseDetail extends StatelessWidget {
  // Declare a field that holds the Todo.
  final DiseaseModel detail;

  // In the constructor, require a Todo.
  DiseaseDetail({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(detail.name),
      ),
      body: ListView(
        children: <Widget>[
          miCard(),
        ],
      ),
    );
  }

  Card miCard() {
    return Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          lineText('Nombre: ${detail.classType}'),
          lineText('Clave: ${detail.code}'),
          lineText('Nombre: ${detail.name}'),
          lineText('Erradicada: ${detail.eradicate}'),
          lineText('Ligada al sexo: ${detail.lsex}'),
          lineText('Trivial: ${detail.trivial}'),
        ],
      ),
    );
  }
}

Container lineText(String myText) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: new Row(
      children: <Widget>[
        new SelectableText(
          myText,
        )
      ],
    ),
  );
}