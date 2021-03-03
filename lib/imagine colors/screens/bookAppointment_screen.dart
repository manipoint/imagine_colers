import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/helper/loading.dart';
import 'package:imagine_colers/imagine%20colors/providers/auth_provider.dart';
import 'package:imagine_colers/imagine%20colors/screens/packageOffer_creen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:imagine_colers/main%20util/utils/AppDialogs.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

class ICBookAppointmentScreen extends StatefulWidget {
  static String tag = '/BookAppointmentScreen';
  @override
  _ICBookAppointmentScreenState createState() =>
      _ICBookAppointmentScreenState();
}

class _ICBookAppointmentScreenState extends State<ICBookAppointmentScreen> {
  String textPay = '';
  final String key =
      "pk_test_51IHmF2CQgLNnTozRRG3K9HncX2GfkaQ54fPG0mjJcIs9RvlOq87BFxbzocLlGUMRweUSJlMhIPS6TDVxCZ39TWCH002XCfqYMH";
  int currentStep = 0;
  Color likeButtonColor = whiteColor;
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
        publishableKey: key,
        merchantId: 'MERCHANT_ID',
        androidPayMode: "test"));
  }

  @override
  Widget build(BuildContext context) {
    //final productProvide = Provider.of<ICProductProviders>(context);
    final userProvider = Provider.of<AuthProvider>(context);
    Map<int, Color> color = {
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    };
    Widget appointmentStepper() {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: ICGreyColor.withOpacity(.1),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 600,
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(8),
                color: whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Products",
                      style: TextStyle(
                          fontSize: 14,
                          color: ICColorPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    8.height,
                    Container(
                      height: 550,
                      child: ListView.builder(
                        itemCount: userProvider.userModel.chekout.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            shadowColor: Colors.grey.withOpacity(0.3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: commonCacheImageWidget(
                                          userProvider
                                              .userModel.chekout[index].image,
                                          180,
                                          width: 160,
                                          fit: BoxFit.cover),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            userProvider.userModel.name
                                                .capitalizeFirstLetter(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: ICAppTextColorSecondary,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 16, left: 16),
                                          child: Text(
                                            "RS ${userProvider.userModel.chekout[index].price.toString()}",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: ICColorPrimary,
                                            ),
                                          ),
                                        ),
                                        32.height,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 28.0, top: 32),
                                          child: RaisedButton(
                                              onPressed: () async {
                                                bool success = await userProvider
                                                    .removeFromChekout(
                                                        chekoutItem:
                                                            userProvider
                                                                    .userModel
                                                                    .chekout[
                                                                index]);
                                                if (success) {
                                                  userProvider
                                                      .reloadUserModel();
                                                  Loading();
                                                } else {
                                                  Loading();
                                                }
                                                //                await userProvider.addToChekout(
                                                // product: productProvider.products[index],;
                                              },
                                              color: ICColorPrimary,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Text("Remove",
                                                  style: TextStyle(
                                                      color: whiteColor,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('ChekOut',
            style: TextStyle(
                color: ICAppTextColorPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Theme(
          data: ThemeData(primarySwatch: MaterialColor(0xFFff6e40, color)),
          child: Stepper(
            type: StepperType.horizontal,
            physics: BouncingScrollPhysics(),
            controlsBuilder: (context, {onStepCancel, onStepContinue}) =>
                Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 140,
                    child: RaisedButton(
                      onPressed: () {
                        switch (currentStep) {
                          case 0:
                            setState(() {
                              print("case 0 current step is $currentStep ");
                              currentStep += 1;
                              checkIfNativePayReady();
                            });
                            return;
                          default:
                            if (currentStep < 2) {
                              setState(() {
                                print(
                                    "case defult current step is $currentStep ");

                                currentStep += 1;
                              });
                            } else {
                              currentStep = 0;
                            }
                        }
                      },
                      color: ICColorPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        ICBtnContinue,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: 140,
                    child: RaisedButton(
                      onPressed: () {
                        if (currentStep > 0) {
                          setState(() {
                            currentStep -= 1;
                          });
                        } else {
                          currentStep = 0;
                          finish(context);
                        }
                      },
                      color: ICColorPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(ICBtnCancel,
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            steps: [
              Step(
                  title: Text(ICStepperBookAppointment,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ICAppTextColorSecondary)),
                  content: Container(
                    child: appointmentStepper(),
                  ),
                  isActive: currentStep >= 0,
                  state: currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                  title: Text(ICStepperPayment,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ICAppTextColorSecondary)),
                  content: paymentStepper(),
                  isActive: currentStep >= 0,
                  state: currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                title: Text(ICStepperFinished,
                    style: TextStyle(color: ICAppTextColorSecondary)),
                content: finishedStepper(),
                isActive: currentStep >= 0,
                state:
                    currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
            ],
            currentStep: currentStep,
            onStepTapped: (value) {
              currentStep = value;
            },
          ),
        ),
      ),
    );
  }

  Widget paymentStepper() {
    final userProvide = Provider.of<AuthProvider>(context);
    return SingleChildScrollView(
      child: Container(
        color: ICGreyColor.withOpacity(.1),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product',
              style: TextStyle(
                  color: ICAppTextColorPrimary, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                              //placeholder: placeholderWidgetFn(),
                              ICMug,
                              height: 70,
                              width: 120,
                              fit: BoxFit.cover),
                        ),
                        8.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Al-Madina Studio',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ICAppTextColorPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                            8.height,
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 12, color: ICAppTextColorSecondary),
                                Text('Buldia Road ,Chishtian',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ICAppTextColorSecondary)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Imagian Colors',
                            style: TextStyle(
                                fontSize: 14,
                                color: ICAppTextColorPrimary,
                                fontWeight: FontWeight.bold)),
                        Text('1:30 - 2:30 PM',
                            style:
                                TextStyle(color: ICColorPrimary, fontSize: 14)),
                      ],
                    ),
                    16.height,
                    Row(
                      children: [
                        Icon(Icons.person,
                            size: 14, color: ICAppTextColorSecondary),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Naveed ',
                            style: TextStyle(
                                color: ICAppTextColorSecondary, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1:30-2:30 PM',
                              style: TextStyle(
                                  fontSize: 14, color: ICAppTextColorPrimary)),
                          Text('June 15,2020',
                              style: TextStyle(
                                  fontSize: 14, color: ICAppTextColorPrimary)),
                          Padding(
                              padding: EdgeInsets.only(left: 45),
                              child: Text(
                                  userProvide.userModel.totalPrice
                                      .ceil()
                                      .toString(),
                                  style: TextStyle(fontSize: 14))),
                        ],
                      ),
                    ),
                    8.height,
                    Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: ICGreyColor.withOpacity(0.3)),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Pay',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ICAppTextColorPrimary,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              userProvide.userModel.totalPrice
                                  .ceil()
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ICColorPrimary,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ICTxtPaymentMethods,
                    style: TextStyle(
                        fontSize: 14,
                        color: ICAppTextColorPrimary,
                        fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {
                      createPaymentMethod();
                    },
                    child: Text(
                      ICTxtAddMethod,
                      style: TextStyle(color: ICColorPrimary),
                    )),
              ],
            ),
            8.height,
            // Container(
            //   margin: EdgeInsets.only(top: 8),
            //   color: whiteColor,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 8),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             Image.asset(ICVisaCardImg, height: 40, width: 40),
            //             16.width,
            //             Text('**** **** *123',
            //                 style: TextStyle(color: ICAppTextColorPrimary)),
            //           ],
            //         ),
            //         Radio(
            //             value: 0,
            //             groupValue: _radioVal,
            //             activeColor: ICColorPrimary,
            //             onChanged: (value) => someThing(value)),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.only(top: 8),
            //   color: whiteColor,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 8),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             Image.asset(ICMasterCardImg, height: 40, width: 40),
            //             16.width,
            //             Text('**** **** *333',
            //                 style: TextStyle(color: ICAppTextColorPrimary)),
            //           ],
            //         ),
            //         Radio(
            //           value: 1,
            //           groupValue: _radioVal,
            //           activeColor: ICColorPrimary,
            //           focusColor: ICAppTextColorSecondary,
            //           onChanged: (value) => someThing(value),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 8),
              color: whiteColor,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(textPay,
                      style: TextStyle(color: ICAppTextColorPrimary))),
            ),
          ],
        ),
      ),
    );
  }

  Widget finishedStepper() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8),
        color: ICGreyColor.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height / 2.5,
              color: whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Al-Madina Color Leb',
                          style: TextStyle(
                              fontSize: 14,
                              color: ICAppTextColorPrimary,
                              fontWeight: FontWeight.bold)),
                      16.height,
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 14, color: ICAppTextColorSecondary),
                          8.width,
                          Text('Model town Lahore.',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ICAppTextColorSecondary)),
                        ],
                      ),
                      16.height,
                      Text('146566311684641',
                          style: TextStyle(
                              fontSize: 14,
                              color: ICAppTextColorPrimary,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  8.height,
                  Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: ICGreyColor.withOpacity(0.3)),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mug Printing',
                          style: TextStyle(
                              fontSize: 14,
                              color: ICAppTextColorPrimary,
                              fontWeight: FontWeight.bold)),
                      Text('November 15,2020',
                          style: TextStyle(
                              color: ICColorPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person,
                              size: 14, color: ICAppTextColorSecondary),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Adnan Shreef',
                                style: TextStyle(
                                    color: ICAppTextColorSecondary,
                                    fontSize: 14)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('1:30 - 2:30 PM',
                              style: TextStyle(
                                  color: ICColorPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  8.height,
                  Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: ICGreyColor.withOpacity(0.3)),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Scan Barcode',
                          style: TextStyle(
                              fontSize: 14, color: ICAppTextColorSecondary)),
                      Image.asset(ICBarCodeImg, height: 50, width: 120),
                    ],
                  ),
                ],
              ),
            ),
            16.height,
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    padding: EdgeInsets.all(12),
                    onPressed: () {
                      finish(context);
                      ICBookAppointmentScreen().launch(context);
                    },
                    color: ICColorPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(ICTxtBookMoreAppointment,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                8.height,
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    padding: EdgeInsets.all(12),
                    onPressed: () {
                      finish(context);
                      ICPackageOfferScreen();
                    },
                    color: whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: ICColorPrimary)),
                    child: Text(ICTxtGoAppointment,
                        style: TextStyle(
                            color: ICColorPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
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
          textPay =
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
