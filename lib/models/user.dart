class UserModel{
  String? name;
  int? age;
  int? phone;
  String? uid;

  UserModel({this.name,this.age,this.phone, this.uid});

  Map<String, dynamic> toJson() => {
    'name' : name,
    'age' : age,
    'phone' : phone,
    'uid': uid,
  };

  static UserModel fromJson(Map<String,dynamic> json) => UserModel(
    name: json['name'],
    phone: json['phone'],
    age: json['age'],
    uid: json['uid'],
  );

}
