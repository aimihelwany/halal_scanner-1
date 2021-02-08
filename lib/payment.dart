import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Pay(),
      ),
    );
  }
}

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  TextEditingController _controller = TextEditingController();
  Razorpay _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.tealAccent,
                      ))),
            ),
            RaisedButton(
                onPressed: () {
                  openCheckout();
                },
                child: Text('Pay Now'))
          ],
        ),
      ),
    );
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_0gTJtpLf7I1epI',
      'amount':
          (double.parse(_controller.text) * 100.roundToDouble()).toString(),
      'name': 'Halal Scanner',
      'description': 'Trial App',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/mytestApp.appspot.com/o/images%2FpZm8daajsIS4LvqBYTiWiuLIgmE2?alt=media&token=3kuli4cd-dc45-7845-b87d-5c4acc7da3c2',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("SUCCESS: " + response.paymentId)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
            "ERROR: " + response.code.toString() + " - " + response.message)));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("EXTERNAL_WALLET: " + response.walletName)));
  }
}
