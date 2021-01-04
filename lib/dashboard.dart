import 'package:flutter/material.dart';
import 'package:halal_scanner/sign_in.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        title: Text('Halal Scanner'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
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
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage(
                'assets/logo.png',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                'WELCOME TO HALAL SCANNER APP',
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
                hintText: 'Search',
              ),
              onChanged: (val) {
                setState(() => search = val);
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton.icon(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: Text(
                'Search',
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[300],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        iconSize: 20.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Scan Barcode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscribe',
          )
        ],
      ),
    );
  }
}
