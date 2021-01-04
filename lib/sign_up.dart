import 'package:flutter/material.dart';
import 'package:halal_scanner/dashboard.dart';
import 'package:halal_scanner/sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        title: Text('Halal Scanner'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignIn(),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 5.0,
        ),
        child: Form(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 70.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  'SIGN UP TO HALAL SCANNER APP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
                onChanged: (val) {
                  setState(() => username = val);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.green[400],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
