import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/helper/constent.dart';
import 'package:imagine_colers/imagine%20colors/providers/auth_provider.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:cloud_functions/cloud_functions.dart';

class StripeSample extends StatefulWidget {
  @override
  _StripeSampleState createState() => _StripeSampleState();
}

class _StripeSampleState extends State<StripeSample> {
  String text = 'Click the button to start the payment';
  User user;
  bool showSpinner = false;

  double getPayment({double totalCast}) {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    double totalAmount = totalCast;
    totalAmount = provider.userModel.totalPrice;
    return totalAmount;
  }

  @override
  void initState() {
    super.initState();
    getPayment();
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51IHmF2CQgLNnTozRRG3K9HncX2GfkaQ54fPG0mjJcIs9RvlOq87BFxbzocLlGUMRweUSJlMhIPS6TDVxCZ39TWCH002XCfqYMH",
        merchantId: 'MERCHANT_ID',
        androidPayMode: "test"));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    double totalCost = provider.userModel.totalPrice.ceilToDouble();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Payment',
            style: TextStyle(
                color: ICAppTextColorPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  startPaymentProcess();
                },
                color: ICColorPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  'Total Payable RS ${totalCost.toString()}',
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              Text(
                text,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
final HttpsCallable intent =
      FirebaseFunctions.instance.httpsCallable("StripePI");
  startPaymentProcess() {
    double amount = getPayment();
    // change amount into dollers
    amount = amount / 161;
    StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
        .then((value) async{
      //multiplying 100 will change into cents
      amount = amount * 100.0;
      
      await intent.call(<String, dynamic>{'amount': amount.toInt(), 'currency': 'usd'}).then(
          (response) {
        confirmDialog(response.data["clint_secret"], value);
      });
    });
  }

  confirmPayment(String clintSecret, PaymentMethod paymentMethod) {
    StripePayment.confirmPaymentIntent(PaymentIntent(
            clientSecret: clintSecret, paymentMethodId: paymentMethod.id))
        .then((value) {
      addPymentDetailsToFireStore();
      final snackBar = SnackBar(
        content: Text('Payment Successfull'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void addPymentDetailsToFireStore() {
    int amount = getPayment().toInt();
    User user;
    firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .collection("payments")
        .add({"currency": "USD", "amount": amount});
  }

  confirmDialog(String clintSecret, PaymentMethod paymentMethod) {
    double amount = getPayment();
    if (!Platform.isIOS) {
      return AlertDialog(
        title: new Text(
          "ConfirmPayment",
        ),
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Make Payment",
                // style: TextStyle(fontSize: 25),
              ),
              Text("Charge amount:\$$amount")
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
              "CANCEL",
            ),
            onPressed: () {
              Navigator.of(context).pop();
              final snackBar = SnackBar(
                content: Text('Payment Cancelled'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          new FlatButton(
            child: new Text(
              "Confirm",
            ),
            onPressed: () {
               confirmPayment(clintSecret, paymentMethod);
              Navigator.of(context).pop();
             
            },
          ),
        ],
      );
    } else {
      return CupertinoAlertDialog(
          title: Text("Make Payment"),
          content: new Text("Confirm"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: new Text(
                "Cancel"[0].toUpperCase() + "Cancel".substring(1).toLowerCase(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: new Text(
                "Confirm"[0].toUpperCase() +
                    "Confirm".substring(1).toLowerCase(),
              ),
              onPressed: () {
                confirmPayment(clintSecret, paymentMethod);
                Navigator.of(context).pop();
                
              },
            )
          ]);
    }
  }

}