class DiagnosticsModel{
  String? diagnosisName;
  String? doctorName;
  String? imageUrl;

  DiagnosticsModel({required this.diagnosisName, required this.doctorName,this.imageUrl});

  Map<String, dynamic> toJson() => {
    'diagnosisName' : diagnosisName,
    'doctorName' : doctorName,
    'imageUrl' : imageUrl,
  };

  static DiagnosticsModel fromJson(Map<String,dynamic> json) => DiagnosticsModel(
    diagnosisName: json['diagnosisName'],
    doctorName: json['doctorName'],
    imageUrl: json['imageUrl'],
  );

}

