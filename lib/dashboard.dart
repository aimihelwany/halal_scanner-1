import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:halal_scanner/addProduct.dart';
import 'package:halal_scanner/auth.dart';
import 'package:halal_scanner/sign_in.dart';
import 'package:halal_scanner/result.dart';
import 'package:halal_scanner/subscribe.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthService _auth = AuthService();
  String search = '';
  String _data = '';

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#000000', 'Cancel', true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        title: Text('Halal Scanner'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
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
                  fontSize: 15.0,
                ),
              ),
              color: Colors.green[400],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalalResult(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22),
        backgroundColor: Colors.greenAccent,
        visible: true,
        curve: Curves.bounceIn,
        children: [
          // FAB 1
          SpeedDialChild(
            child: Icon(Icons.subscriptions),
            backgroundColor: Colors.greenAccent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Subscribe(),
                ),
              );
            },
            label: 'Subscriptions',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.greenAccent,
          ),
          // FAB 2
          SpeedDialChild(
            child: Icon(Icons.camera_alt_rounded),
            backgroundColor: Colors.greenAccent,
            onTap: () => _scan(),
            label: 'Scan',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.greenAccent,
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.greenAccent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProduct(),
                ),
              );
            },
            label: 'Add Product',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
