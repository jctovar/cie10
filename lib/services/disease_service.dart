
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/disease_model.dart';

class Services {
  static const String url = 'momai.iztacala.unam.mx';
  static const String path = '/api/disease/';

  static Future<List<DiseaseModel>> getDiseases() async {
    try {
      final response = await http.get(Uri.https(url, path));
      if (response.statusCode == 200) {
        List<DiseaseModel> list = parseJson(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<DiseaseModel> parseJson(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<DiseaseModel>((json) => DiseaseModel.fromJson(json)).toList();
  }
}