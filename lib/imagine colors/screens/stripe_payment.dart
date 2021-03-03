import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/providers/auth_provider.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/main%20util/utils/AppDialogs.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

class ICStripepayment extends StatefulWidget {
  @override
  _ICStripepaymentState createState() => _ICStripepaymentState();
}

class _ICStripepaymentState extends State<ICStripepayment> {
  String text = 'Click the button to start the payment';

  double totalCost = 0.0;
  double tax = 0.0;
  double taxPercent = 0.1;
  int amount = 0;
  bool showSpinner = false;
  String paymentUrl =
      'https://us-central1-imagine-colors.cloudfunctions.net/StripePI';

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
              ElevatedButton(
                onPressed: () {
                  checkIfNativePayReady();
                },
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

  void checkIfNativePayReady() async {
    print('started to check if native pay ready');
    bool deviceSupportNativePay = await StripePayment.deviceSupportsNativePay();
    bool isNativeReady = await StripePayment.canMakeNativePayPayments(
        ['american_express', 'visa', 'maestro', 'master_card']);
    deviceSupportNativePay && isNativeReady
        ? createPaymentMethodNative()
        : createPaymentMethod();
  }

  Future<void> createPaymentMethodNative() async {
    print('started NATIVE payment...');
    StripePayment.setStripeAccount(null);
    double totalCost = getPayment();
    totalCost = (totalCost / 220);
    tax = ((totalCost * taxPercent) * 100).ceil() / 100;
    print("totalbill is ${totalCost.toString()}");
    List<ApplePayItem> items = [];
    items.add(ApplePayItem(
      label: 'Product Price',
      amount: totalCost.toString(),
    ));
    if (taxPercent != 0.0) {
      tax = ((totalCost * taxPercent) * 100).ceil() / 100;
      items.add(ApplePayItem(
        label: 'Tax',
        amount: tax.toString(),
      ));
    }
    items.add(ApplePayItem(
      label: 'Almadina color leb',
      amount: (totalCost + tax).toString(),
    ));
    amount = ((totalCost + tax) * 100).toInt();
    print('amount in pence/cent which will be charged = $amount');
    //step 1: add card
    PaymentMethod paymentMethod = PaymentMethod();
    Token token = await StripePayment.paymentRequestWithNativePay(
      androidPayOptions: AndroidPayPaymentRequest(
        totalPrice: (totalCost + tax).toStringAsFixed(2),
        currencyCode: 'GBP',
      ),
      applePayOptions: ApplePayPaymentOptions(
        countryCode: 'GB',
        currencyCode: 'GBP',
        items: items,
      ),
    );
    paymentMethod = await StripePayment.createPaymentMethod(
      PaymentMethodRequest(
        card: CreditCard(
          token: token.tokenId,
        ),
      ),
    );
    paymentMethod != null
        ? processPaymentAsDirectCharge(paymentMethod)
        : showDialog(
            context: context,
            builder: (BuildContext context) => ShowDialogToDismiss(
                title: 'Error',
                content:
                    'It is not possible to pay with this card. Please try again with a different card',
                buttonText: 'CLOSE'));
  }

  Future<void> createPaymentMethod() async {
    StripePayment.setStripeAccount(null);
    double totalCost = getPayment();
    tax = ((totalCost * taxPercent) * 100).ceil() / 100;
    amount = ((tax + totalCost)).toInt();
    print('amount in pence/cent which will be charged at card = $amount');
    //add card
    PaymentMethod paymentMethod = PaymentMethod();
    paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    ).then((PaymentMethod paymentMethod) {
      return paymentMethod;
    }).catchError((e) {
      print('Error Card: ${e.toString()}');
    });
    paymentMethod != null
        ? processPaymentAsDirectCharge(paymentMethod)
        : showDialog(
            context: context,
            builder: (BuildContext context) => ShowDialogToDismiss(
                  title: 'Error',
                  content:
                      'It is not possible to pay with this card. Please try again with a different card',
                  buttonText: 'CLOSE',
                ));
  }

  Future<void> processPaymentAsDirectCharge(PaymentMethod paymentMethod) async {
    setState(() {
      showSpinner = true;
    });
    // request to create PaymentIntent, attempt to confirm the payment & return PaymentIntent
    amount = amount;
    print("amount in  processPaymentAsDirectCharge is $amount");
    final http.Response response = await http.post(
        "$paymentUrl?amount=$amount&currency=GBP&paym=${paymentMethod.id}");
    print("Now i decode");
    print(jsonDecode(response.body));
    if (response.body != null && response.body != "error") {
      // print(jsonDecode(response.body));
      final paymentIntentX = jsonDecode(response.body);
      final status = paymentIntentX['paymentIntent']['status'];
      final strAccount = paymentIntentX['stripeAccount'];
      //check if payment was succesfully confirmed
      if (status == 'succeeded') {
        //payment was confirmed by the server without need for futher authentification
        StripePayment.completeNativePayRequest();
        setState(() {
          text =
              'payment completed.${paymentIntentX['paymentIntent']['amount'].toString()}p succesfully charged';
          showSpinner = false;
        });
      } else {
        // there is a need to authenticate
        StripePayment.setStripeAccount(strAccount);

        await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntentX['paymentIntent']['client_secret'],
          paymentMethodId: paymentIntentX['paymentIntent']['payment_method'],
        )).then(
          (value) async {
            //This code will be executed if the authentication is successful
            //request the server to confirm the payment with
            final statusFinal = value.status;
            if (statusFinal == 'succeeded') {
              StripePayment.completeNativePayRequest();
              setState(() {
                showSpinner = false;
              });
            } else if (statusFinal == 'processing') {
              StripePayment.cancelNativePayRequest();
              setState(() {
                showSpinner = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ShowDialogToDismiss(
                      title: 'Warning',
                      content:
                          'Unknown Case The payment is still in \'processing\' state. This is unusual. Please contact us',
                      buttonText: 'CLOSE'));
            } else {
              StripePayment.cancelNativePayRequest();
              setState(() {
                showSpinner = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ShowDialogToDismiss(
                      title: 'Error',
                      content:
                          'There was an error to confirm the payment. Details: $statusFinal',
                      buttonText: 'CLOSE'));
            }
          },
          //If Authentication fails, a PlatformException will be raised which can be handled here
        ).catchError((e) {
          StripePayment.cancelNativePayRequest();
          setState(() {
            showSpinner = false;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) => ShowDialogToDismiss(
                  title: 'Error',
                  content:
                      'Case B1 There was an error to confirm the payment. Please try again with another card',
                  buttonText: 'CLOSE'));
        });
      }
    } else {
      // Case A
      StripePayment.cancelNativePayRequest();
      setState(() {
        showSpinner = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: 'Error',
              content:
                  'Case A There was an error to confirm the payment. Please try again with another card',
              buttonText: 'CLOSE'));
    }
  }
}
