import 'package:flutter/material.dart';
import 'package:halal_scanner/dashboard.dart';
import 'package:halal_scanner/user.dart';
import 'package:provider/provider.dart';
import 'package:halal_scanner/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

      if (user == null){
        return Authenticate();
      } else {
        return Dashboard();
    }
  }
}