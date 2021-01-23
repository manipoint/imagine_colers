import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/helper/loading.dart';
import 'package:imagine_colers/imagine%20colors/providers/auth_provider.dart';
import 'package:imagine_colers/imagine%20colors/screens/dashboard_screen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ICRegistrationScreen extends StatefulWidget {
  static String tag = '/NewRegistrationScreen';

  @override
  NewRegistrationScreenState createState() => NewRegistrationScreenState();
}

class NewRegistrationScreenState extends State<ICRegistrationScreen> {
  bool _showPassword = false;
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    fullNameFocusNode.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    dobFocusNode.dispose();
    addressFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    changeStatusColor(ICColorPrimary);

    return SafeArea(
      child: authProvider.status == Status.Authenticating
          ? Loading()
          : Scaffold(
              backgroundColor: ICColorPrimary,
              body: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(ICAppLogo, height: 150, width: 150),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      color: whiteColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: authProvider.name,
                            focusNode: fullNameFocusNode,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(passwordFocusNode);
                            },
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICAppDividerColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICColorPrimary)),
                              labelText: "Full Name",
                              labelStyle:
                                  TextStyle(color: ICGreyColor, fontSize: 14),
                            ),
                          ),
                          TextFormField(
                            controller: authProvider.password,
                            focusNode: passwordFocusNode,
                            obscureText: !_showPassword,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(color: ICGreyColor, fontSize: 14),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: ICColorPrimary,
                                    size: 20),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICAppDividerColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICColorPrimary)),
                            ),
                          ),
                          TextFormField(
                            controller: authProvider.email,
                            focusNode: emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(dobFocusNode);
                            },
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICAppDividerColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICColorPrimary)),
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(color: ICGreyColor, fontSize: 14),
                            ),
                          ),
                          TextFormField(
                            controller: authProvider.dateOfBirth,
                            keyboardType: TextInputType.datetime,
                            focusNode: dobFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(addressFocusNode);
                            },
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICAppDividerColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICColorPrimary)),
                              labelText: "Date of Birth",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2014, 8),
                                      lastDate: DateTime(2101));
                                },
                                child: Icon(Icons.calendar_today,
                                    color: ICColorPrimary, size: 16),
                              ),
                              labelStyle:
                                  TextStyle(color: ICGreyColor, fontSize: 14),
                            ),
                          ),
                          TextFormField(
                            controller: authProvider.address,
                            focusNode: addressFocusNode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.multiline,
                            maxLines: 2,
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICAppDividerColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ICColorPrimary)),
                              labelText: "Your Address",
                              suffixIcon: Icon(Icons.location_on,
                                  color: ICColorPrimary, size: 18),
                              labelStyle:
                                  TextStyle(color: ICGreyColor, fontSize: 14),
                            ),
                          ),
                          16.height,
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              padding: EdgeInsets.all(12),
                              onPressed: () async {
                                if (!await authProvider.signUp()) {
                                  // Scaffold.of(context).showSnackBar(
                                  //     SnackBar(
                                  //         content:
                                  //             Text("Registration failed!")));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text('Registration failed!'),
                                  ));
                                  return;
                                }
                                authProvider.clearController();
                                finish(context);
                                ICDashedBoardScreen().launch(context);
                              },
                              color: ICColorPrimary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                ICBtnSignUp,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          24.height,
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                finish(context);
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: ICTxtAccount,
                                  style:
                                      TextStyle(color: ICAppTextColorSecondary),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ICBtnSignIn,
                                        style: TextStyle(color: ICColorPrimary))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          8.height,
                        ],
                      ),
                    ),
                  ),
                  BackButton(color: Colors.white),
                ],
              ),
            ),
    );
  }
}
