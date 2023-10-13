class TestModel {

  String? name;
  String? labName;
  String? fileUrl;

  TestModel({required this.name, this.fileUrl,required this.labName});

  Map<String, dynamic> toJson() => {
    'name' : name,
    'labName' : labName,
    'fileUrl' : fileUrl,
  };

  static TestModel fromJson(Map<String,dynamic> json) => TestModel(
    name: json['name'],
    labName: json['labName'],
    fileUrl: json['fileUrl'],
  );
}