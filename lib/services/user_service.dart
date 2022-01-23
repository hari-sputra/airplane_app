import 'package:air_plane/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection("user");

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        hobby: snapshot['hobby'],
        balance: snapshot['balance'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserById(UserModel user) async {
    try {
     return _userReference.doc(user.id).update({
        "email": user.email,
        "name": user.name,
        "hobby": user.hobby,
      }).then((value) {
        print("User update");
        // ignore: invalid_return_type_for_catch_error
      }).catchError((err) => print("update user failed: $err"));
    } catch (e) {
      rethrow;
    }
  }
}
