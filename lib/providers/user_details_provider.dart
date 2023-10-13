import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:projects/models/user.dart';
import 'package:projects/screens/user_detail_screen.dart';

class UserDetailsProvider with ChangeNotifier {

  Future createUSer({String? name, int? phone, int? age}) async {
    final docUser = FirebaseFirestore.instance.collection('usrs').doc(phone.toString());
    final user = UserModel(name: name,phone: phone,age: age);
    final userJson = user.toJson();
    await docUser.set(userJson);
  }

}