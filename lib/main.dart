import 'package:flutter/material.dart';
import 'package:halal_scanner/dashboard.dart';
import 'package:halal_scanner/sign_in.dart';
import 'package:halal_scanner/sign_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}
