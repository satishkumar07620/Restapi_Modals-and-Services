// ignore_for_file: file_names, unnecessary_null_comparison, annotate_overrides

import 'package:flutter/material.dart';

import 'Users.dart';
import 'Services.dart';

class JsonParseDemo extends StatefulWidget {
  const JsonParseDemo({super.key});

  @override
  State<JsonParseDemo> createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo>{
  late List<UsersResponseModel> _users;
  late bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading...' : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: null == _users ? 0 : _users.length,
            itemBuilder: (context, index) {
              UsersResponseModel usersResponseModel = _users[index];
              return ListTile(
                title: Text(usersResponseModel.name!),
                subtitle: Text(usersResponseModel.email!),
              );
            }),
      ),
    );
  }
}
