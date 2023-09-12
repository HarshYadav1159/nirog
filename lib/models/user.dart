class UserModel{
  String? name;
  int? age;
  int? phone;

  UserModel({this.name,this.age,this.phone});

  Map<String, dynamic> toJson() => {
    'name' : name,
    'age' : age,
    'phone' : phone,
  };

  static UserModel fromJson(Map<String,dynamic> json) => UserModel(
    name: json['name'],
    phone: json['phone'],
    age: json['age'],
  );

}
