import 'package:api_problem/userlist.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch API Data',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data'),
        ),
        body: UserList(),
      ),
      routes: {
        // DetailScreen.routeName: (ctx) => DetailScreen(),
      },
    );
  }
}
