import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/providers/auth_provider.dart';
import 'package:imagine_colers/imagine%20colors/screens/dashboard_screen.dart';
import 'package:imagine_colers/imagine%20colors/screens/discover_screen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ICAccountInformationScreen extends StatefulWidget {
  static String tag = '/AccountInformationScreen';

  @override
  ICAccountInformationScreenState createState() =>
      ICAccountInformationScreenState();
}

class ICAccountInformationScreenState
    extends State<ICAccountInformationScreen> {
  //bool _showPassword = true;
  // TextEditingController fullNameCont = TextEditingController();
  // TextEditingController dOBCont = TextEditingController();
  // TextEditingController emailCont = TextEditingController();
  // TextEditingController phoneNumCont = TextEditingController();
  // TextEditingController passwordCont = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode dOBFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneNumFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              finish(context);
              ICDashedBoardScreen().launch(context);
            },
            child: Icon(Icons.arrow_back, color: blackColor),
          ),
          title: Text(ICTxtAccountInformation,
              style: TextStyle(
                  color: ICAppTextColorPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Text(ICTxtEdit,
                      style: TextStyle(
                          color: ICColorPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  onTap: () {},
                ),
              ),
            )
          ]),
      body: Container(
        color: ICGreyColor.withOpacity(0.1),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                color: whiteColor,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                        child: CircleAvatar(
                            backgroundImage: AssetImage(ICSign2), radius: 50)),
                    Padding(
                      padding: EdgeInsets.only(left: 80, top: 60),
                      child: IconButton(
                          icon: Image.asset(ICAddIcon, height: 21, width: 21),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 1.0),
                        color: ICGreyColor.withOpacity(0.3),
                        blurRadius: 2.0),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: authProvider.name,
                      focusNode: fullNameFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(dOBFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: userProvider.userModel.name,
                        labelStyle: TextStyle(color: ICGreyColor, fontSize: 14),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ICAppDividerColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ICAppDividerColor)),
                      ),
                    ),
                    TextFormField(
                      controller: authProvider.dateOfBirth,
                      focusNode: dOBFocusNode,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(emailFocusNode);
                      },
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ICAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ICAppDividerColor)),
                        labelText: userProvider.userModel.dob,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2014, 8),
                              lastDate: DateTime(2101),
                            );
                          },
                          child: Icon(Icons.calendar_today,
                              color: ICColorPrimary, size: 16),
                        ),
                        labelStyle: TextStyle(color: ICGreyColor, fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      controller: authProvider.email,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(phoneNumFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: userProvider.userModel.email,
                        labelStyle: TextStyle(color: ICGreyColor, fontSize: 14),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ICAppDividerColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ICAppDividerColor)),
                      ),
                    ),
                    TextFormField(
                      controller: authProvider.address,
                      focusNode: phoneNumFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passWordFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: userProvider.userModel.address,
                        labelStyle: TextStyle(color: ICGreyColor, fontSize: 14),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ICAppDividerColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ICAppDividerColor)),
                      ),
                    ),
                    // TextFormField(
                    //   controller: passwordCont,
                    //   focusNode: passWordFocusNode,
                    //   obscureText: _showPassword,
                    //   keyboardType: TextInputType.text,
                    //   style: TextStyle(color: ICAppTextColorSecondary),
                    //   decoration: InputDecoration(
                    //     labelText: "Password",
                    //     labelStyle: TextStyle(color: ICGreyColor, fontSize: 14),
                    //     suffixIcon: GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           _showPassword = !_showPassword;
                    //         });
                    //       },
                    //       child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off, color: ICColorPrimary, size: 20),
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ICAppDividerColor)),
                    //     focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ICAppDividerColor)),
                    //   ),
                    // ),
                    24.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
// import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
// import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
// import 'package:nb_utils/nb_utils.dart';

// class ICAccountInformationScreen extends StatefulWidget {
//   @override
//   _ICAccountInformationScreenState createState() =>
//       _ICAccountInformationScreenState();
// }

// class _ICAccountInformationScreenState
//     extends State<ICAccountInformationScreen> {
//   TabController tabController;
//   @override
//   Widget build(BuildContext context) {
//     changeStatusColor(Colors.transparent);
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           body: NestedScrollView(
//             headerSliverBuilder: (context, innerBoxIsScrolled) {
//               return [
//                 SliverAppBar(
//                   leading: IconButton(
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       color: white,
//                     ),
//                     onPressed: () {
//                       finish(context);
//                     },
//                   ),
//                   backgroundColor: ICColorPrimary,
//                   pinned: true,
//                   elevation: 4,
//                   expandedHeight: 300,
//                   flexibleSpace: FlexibleSpaceBar(
//                     collapseMode: CollapseMode.pin,
//                     titlePadding: EdgeInsets.all(10),
//                     background: Stack(
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       children: [
//                         Image.asset(
//                           ICSign2,
//                           height: 500,
//                           width: MediaQuery.of(context).size.width,
//                           fit: BoxFit.cover,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 16, top: 200),
//                           child: Text(
//                             'Imran Ch',
//                             style: TextStyle(
//                               color: white,
//                               fontSize: 18,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         )
//                       ],
//                     ),
//                     centerTitle: true,
//                   ),
//                   bottom: TabBar(
//                     controller: tabController,
//                     labelColor: whiteColor,
//                     unselectedLabelColor: whiteColor,
//                     isScrollable: true,
//                     indicatorColor: ICColorPrimary,
//                     tabs: [
//                       Tab(
//                         child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text("My Wishlist",
//                                 style: TextStyle(fontSize: 16))),
//                       ),
//                       Tab(
//                         child: Align(
//                             alignment: Alignment.centerRight,
//                             child: Text("Followed Store",
//                                 style: TextStyle(fontSize: 16))),
//                       ),
//                     ],
//                   ),
//                   actions: [
//                     IconButton(
//                         icon:
//                             Icon(Icons.settings, color: white, size: 30),
//                         onPressed: () {}),
//                   ],
//                 )
//               ];
//             },
//             body: TabBarView(
//               children: [
//                 myWishList(),
//                 followStore(),
//               ],
//             ),
//           ),
//         ),
//       );
//   }

//   Widget myWishList() {
//     return Container();
//   }

//   Widget followStore() {
//     return Container();
//   }
// }
