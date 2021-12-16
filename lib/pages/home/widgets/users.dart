import 'package:app_sqlite/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Dibujando Users");
    final _userProvider = Provider.of<UserProvider>(context);
    final users = _userProvider.users;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            width: double.infinity,
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            _userProvider.deteleUser(idUser: users[index].id ?? 0);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Delete user: ${users[index].firstName}"),
              ),
            );
          },
          key: Key("${users[index].id}"),
          child: ListTile(
            title: Text("${users[index].firstName}"),
            subtitle: Text("${users[index].lastName}"),
            leading: CircleAvatar(
              backgroundImage: NetworkImage("${users[index].avatar}"),
            ),
          ),
        );
      },
    );
  }
}
