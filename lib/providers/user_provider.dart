import 'package:app_sqlite/models/user_model.dart';
import 'package:app_sqlite/providers/db_provider.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> users = [];

  insertUser({
    required UserModel user,
  }) async {
    final response = await DBProvider.db.insertUser(user: user);
    print("Provider: $response");
    user.id = response;

    this.users.add(user);
    notifyListeners();
  }

  deteleUser({
    required int idUser,
  }) async {
    final response = await DBProvider.db.deteleUser(idUser: idUser);
    print(response);
    getAllUsers();
    notifyListeners();
  }

  getAllUsers() async {
    final response = await DBProvider.db.getAllUsers();
    this.users = [...response];
    //this.users.addAll(response);
    notifyListeners();
  }
}
