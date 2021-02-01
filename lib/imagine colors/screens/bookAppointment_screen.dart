import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/screens/packageOffer_creen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ICBookAppointmentScreen extends StatefulWidget {
  static String tag = '/BookAppointmentScreen';
  @override
  _ICBookAppointmentScreenState createState() =>
      _ICBookAppointmentScreenState();
}

class _ICBookAppointmentScreenState extends State<ICBookAppointmentScreen> {
  DateTime dateTime;
  int currentStep = 0;
  int _radioVal = 0;
  Color likeButtonColor = whiteColor;

  void someThing(int value) {
    setState(() {
      _radioVal = value;
    });
  }

  _pickDate() async {
    DateTime time = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (time != null) {
      setState(() {
        dateTime = time;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: ICGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                child: ListTile(
                  title: Text(
                      'Date : ${dateTime.day}/ ${dateTime.month}/ ${dateTime.year}',
                      style: TextStyle(color: ICAppTextColorSecondary)),
                  trailing: Icon(Icons.keyboard_arrow_down,
                      color: ICAppTextColorSecondary),
                  onTap: () => _pickDate(),
                ),
              ),
              Container(
                height: 220,
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(8),
                color: whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ICTxtChooseSpecialList,
                          style: TextStyle(
                              fontSize: 14,
                              color: ICAppTextColorPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ICTxtStylists,
                          style: TextStyle(
                              color: ICColorPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    8.height,
                    Container(
                      height: 177,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            shadowColor: Colors.grey.withOpacity(0.3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.asset(ICMug1,
                                      height: 110,
                                      width: 120,
                                      fit: BoxFit.cover),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Adnan Shreef',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ICAppTextColorSecondary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(top: 8),
                  color: whiteColor,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ICTxtAvailableSlot,
                            style: TextStyle(
                                fontSize: 14,
                                color: ICAppTextColorPrimary,
                                fontWeight: FontWeight.bold)),
                        8.height,
                        Wrap(
                          spacing: 16.0,
                          children: [
                            raiseButton(btnText: '7:30 - 8:30 AM'),
                            raiseButton(btnText: '9:30 - 10:30 AM'),
                            raiseButton(btnText: '4:30 - 5:30 AM'),
                            raiseButton(btnText: '6:30 - 7:30 AM'),
                            raiseButton(btnText: '1:30 - 2:30 AM'),
                            raiseButton(btnText: '3:30 - 4:30 AM'),
                          ],
                        ),
                      ]))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Book Appointment',
            style: TextStyle(
                color: ICAppTextColorPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Theme(
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
                      if (currentStep < 2) {
                        setState(() {
                          currentStep += 1;
                        });
                      } else {
                        currentStep = 0;
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
                state:
                    currentStep >= 0 ? StepState.complete : StepState.disabled),
            Step(
                title: Text(ICStepperPayment,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ICAppTextColorSecondary)),
                content: paymentStepper(),
                isActive: currentStep >= 0,
                state:
                    currentStep >= 2 ? StepState.complete : StepState.disabled),
            Step(
              title: Text(ICStepperFinished,
                  style: TextStyle(color: ICAppTextColorSecondary)),
              content: finishedStepper(),
              isActive: currentStep >= 0,
              state: currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
          currentStep: currentStep,
          onStepTapped: (value) {
            currentStep = value;
          },
        ),
      ),
    );
  }

  Widget paymentStepper() {
    return SingleChildScrollView(
      child: Container(
        color: ICGreyColor.withOpacity(.1),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Services',
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
                              child: Text('Rs 250',
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
                          Text('RS 250',
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
                Text(ICTxtAddMethod,
                    style: TextStyle(
                        fontSize: 14,
                        color: ICColorPrimary,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            8.height,
            Container(
              margin: EdgeInsets.only(top: 8),
              color: whiteColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(ICVisaCardImg, height: 40, width: 40),
                        16.width,
                        Text('**** **** *123',
                            style: TextStyle(color: ICAppTextColorPrimary)),
                      ],
                    ),
                    Radio(
                        value: 0,
                        groupValue: _radioVal,
                        activeColor: ICColorPrimary,
                        onChanged: (value) => someThing(value)),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 8),
              color: whiteColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(ICMasterCardImg, height: 40, width: 40),
                        16.width,
                        Text('**** **** *333',
                            style: TextStyle(color: ICAppTextColorPrimary)),
                      ],
                    ),
                    Radio(
                      value: 1,
                      groupValue: _radioVal,
                      activeColor: ICColorPrimary,
                      focusColor: ICAppTextColorSecondary,
                      onChanged: (value) => someThing(value),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 8),
              color: whiteColor,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Payment in case',
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
}
