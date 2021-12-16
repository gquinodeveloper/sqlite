import 'package:app_sqlite/pages/home/widgets/person_button.dart';
import 'package:app_sqlite/pages/home/widgets/users.dart';
import 'package:app_sqlite/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Dibujando HomePage");
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLITE"),
      ),
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PersonButton(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context, listen: false);
    _userProvider.getAllUsers();
    return Users();
  }
}
