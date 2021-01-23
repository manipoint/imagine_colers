import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:nb_utils/nb_utils.dart';

class ICForgotPasswordScreen extends StatefulWidget {
  static String tag = '/ForgotPasswordScreen';

  @override
  ICForgotPasswordScreenState createState() => ICForgotPasswordScreenState();
}

class ICForgotPasswordScreenState extends State<ICForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ICColorPrimary,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  finish(context);
                },
                icon: Icon(Icons.arrow_back, color: whiteColor),
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(ICTxtForgotPwd, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ICAppTextColorPrimary)),
                    16.height,
                    Text(ICForgotPasswordSubTitle, textAlign: TextAlign.center, style: TextStyle(color: ICAppTextColorSecondary, fontSize: 14)),
                    8.height,
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ICAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ICAppDividerColor)),
                        labelText: "Email",
                        labelStyle: TextStyle(color: ICGreyColor, fontSize: 14),
                      ),
                    ),
                    16.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        padding: EdgeInsets.all(12),
                        onPressed: () {
                          finish(context);
                          //TODO
                          //ICVerificationScreen().launch(context);
                        },
                        color: ICColorPrimary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          ICBtnSend,
                          style: TextStyle(color: whiteColor, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}