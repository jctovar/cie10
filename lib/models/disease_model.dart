class DiseaseModel {
  String id;
  String name;
  String code;
  String lsex;
  String trivial;
  String eradicate;
  String codeclass;
  String classType;

  DiseaseModel({
    required this.id, required this.name, required this.code,
    required this.lsex, required this.trivial, required this.eradicate,
    required this.codeclass, required this.classType
  });

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      id: json["disease_id"] as String,
      name: json["name"] as String,
      code: json["code"] as String,
      lsex: json["lsex"] as String,
      trivial: json["trivial"] as String,
      eradicate: json["eradicate"] as String,
      codeclass: json["codeclass"] as String,
      classType: json["class"] as String,
    );
  }
}