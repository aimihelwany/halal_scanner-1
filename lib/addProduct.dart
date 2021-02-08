import 'package:flutter/material.dart';
import 'package:halal_scanner/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final AuthService _auth = AuthService();
  final db = Firestore.instance;
  String _data = '';
  String _status = '';
  String msg = '';

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
        title: Text(
          'Add Product',
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Barcode No : ',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 0.5,
                      fontSize: 15,
                    ),
                  ),
                  Text(_data),
                  FlatButton.icon(
                    label: Text(''),
                    icon: Icon(Icons.camera_alt_rounded),
                    onPressed: () => _scan(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Status : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 150,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: ' Status',
                      ),
                      onChanged: (val) {
                        setState(() => _status = val);
                      },
                    ),
                  )
                ],
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: () async {
                  await db.collection("products").add(
                    {
                      'barcode': _data,
                      'status': _status,
                    },
                  );
                },
              ),
              SizedBox(height: 20.0),
              Text(
                msg,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
