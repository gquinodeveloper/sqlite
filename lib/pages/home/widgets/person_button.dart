import 'package:app_sqlite/models/user_model.dart';
import 'package:app_sqlite/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonButton extends StatelessWidget {
  const PersonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Dibujando PersonButton");
    return FloatingActionButton(
      child: Icon(Icons.person_outline),
      onPressed: () {
        final _userProvider = Provider.of<UserProvider>(context, listen: false);
        _userProvider.insertUser(
          user: UserModel(
              firstName: "Cristina",
              lastName: "Torres",
              avatar: "https://reqres.in/img/faces/1-image.jpg"),
        );
      },
    );
  }
}
