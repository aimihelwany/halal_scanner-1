import 'package:flutter/material.dart';

class AdminSignIn extends StatefulWidget {
  final Function toggleView;
  AdminSignIn({this.toggleView});
  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('Admin'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text(
                'Enter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              color: Colors.green[400],
              onPressed: () {
                widget.toggleView();
              },
            ),
          ],
        ),
      ),
    );
  }
}
