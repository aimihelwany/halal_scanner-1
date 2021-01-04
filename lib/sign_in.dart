import 'package:flutter/material.dart';
import 'package:halal_scanner/dashboard.dart';
import 'package:halal_scanner/sign_up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String username = '';
  String password = '';

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
            label: Text('Sign Up'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 10.0,
        ),
        child: Form(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 70.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'SIGN IN TO HALAL SCANNER APP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
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
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text(
                  'Sign In',
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
