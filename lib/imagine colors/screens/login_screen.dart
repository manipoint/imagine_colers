import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagine_colers/imagine%20colors/helper/loading.dart';
import 'package:imagine_colers/imagine%20colors/providers/auth_provider.dart';
import 'package:imagine_colers/imagine%20colors/screens/registration_screen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'dashboard_screen.dart';
import 'forget_password.dart';

class ICLoginScreen extends StatefulWidget {
  static String tag = '/LoginScreen';
  @override
  _ICLoginScreenState createState() => _ICLoginScreenState();
}

class _ICLoginScreenState extends State<ICLoginScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool _showPwd = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode pwdFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    pwdFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: authProvider.status == Status.Authenticating
          ? Loading()
          : Scaffold(
              key: _key,
              backgroundColor: ICColorPrimary,
              body: Stack(
                children: [
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
                        children: [
                          TextFormField(
                            controller: authProvider.email,
                            focusNode: emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(pwdFocusNode);
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
                            controller: authProvider.password,
                            focusNode: pwdFocusNode,
                            obscureText: !_showPwd,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(color: ICGreyColor, fontSize: 14),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPwd = !_showPwd;
                                  });
                                },
                                child: Icon(
                                    _showPwd
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
                          SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                ICForgotPasswordScreen().launch(context);
                              },
                              child: Text(ICTxtForgetPwd,
                                  style: TextStyle(
                                      color: ICAppTextColorSecondary,
                                      fontSize: 14)),
                            ),
                          ),
                          16.height,
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              padding: EdgeInsets.all(12),
                             onPressed: () async {
                                if (!await authProvider.logIn()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Login Failed"),
                                  ));
                                  return;
                                }

                                //authProvider.clearController();
                                finish(context);
                                ICDashedBoardScreen().launch(context);
                              },
                              color: ICColorPrimary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(ICBtnSignIn,
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          16.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //Image.asset(ICTwitterIcon, height: 40, width: 40),
                              Image.asset(
                                ICTwitterIcon,
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                ICFacebookIcon,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                ICGoogleIcon,
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),

                              //Image.asset(ICFacebookIcon, height: 40, width: 40),
                              //Image.asset(ICGoogleIcon, height: 40, width: 40),
                            ],
                          ),
                          24.height,
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                ICRegistrationScreen().launch(context);
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: "You don't have an account! ",
                                  style:
                                      TextStyle(color: ICAppTextColorSecondary),
                                  children: [
                                    TextSpan(
                                        text: ICBtnSignUp,
                                        style:
                                            TextStyle(color: ICColorPrimary)),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
