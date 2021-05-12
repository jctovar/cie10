import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';
import '../services/disease_service.dart';
import '../models/disease_model.dart';
import 'disease_detail.dart';
import '../widgets/drawer.dart';

class DiseaseList extends StatefulWidget {
  static const String routeName = 'disease';

  @override
  _DiseaseListState createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  List<DiseaseModel> diseases = List.empty();
  List<DiseaseModel> filteredDiseases = List.empty();
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    Services.getDiseases().then((diseasesFromServer) {
      setState(() {
        diseases = diseasesFromServer;
        filteredDiseases = diseases;
      });
    });
  }

  void clearText() {
    textEditingController.clear();
    setState(() {
      filteredDiseases = diseases;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _controller;
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de enfermedades (CIE-10)'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14.0),
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar por nombre o código',
                suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: clearText
                )
            ),
            onChanged: (string) {
              EasyDebounce.debounce(
                  'my-debouncer',                 // <-- An ID for this particular debouncer
                  Duration(milliseconds: 1000),    // <-- The debounce duration
                      () => setState(() {
                    filteredDiseases = diseases
                        .where((u) => (u.name
                        .toLowerCase()
                        .contains(string.toLowerCase()) ||
                        u.code.toLowerCase().contains(string.toLowerCase())))
                        .toList();
                  })                // <-- The target method
              );
            },
            autocorrect: true,
            autofocus: true,
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: filteredDiseases.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: ListTile(
                      title: SelectableText(filteredDiseases[index].name),
                      subtitle: SelectableText(filteredDiseases[index].code),
                      trailing: IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () => openDetailPage(filteredDiseases[index], index)
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  openDetailPage(DiseaseModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DiseaseDetail(
          detail: data,
        );
      }),
    );
  }
}
