class DiagnosticsModel{
  String? diagnosisName;
  String? doctorName;
  String? imageUrl;
  String? date;

  DiagnosticsModel({required this.diagnosisName, required this.doctorName,this.imageUrl,this.date});

  Map<String, dynamic> toJson() => {
    'diagnosisName' : diagnosisName,
    'doctorName' : doctorName,
    'imageUrl' : imageUrl,
    'date' : date,
  };

  static DiagnosticsModel fromJson(Map<String,dynamic> json) => DiagnosticsModel(
    diagnosisName: json['diagnosisName'],
    doctorName: json['doctorName'],
    imageUrl: json['imageUrl'],
    date : json['date'],
  );
}

