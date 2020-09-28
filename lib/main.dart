import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './books.dart';
import './auth.dart';
import './login.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => AuthProvider(),
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanctum Books',
      home: new Scaffold(
        body: Center(
            child: Consumer<AuthProvider>(
              builder: (context, auth, child) {
                switch (auth.isAuthenticated) {
                  case true:
                    return BookList();
                  default:
                    return LoginForm();
                }
              },
            )
        ),
      )
    );
  }
}