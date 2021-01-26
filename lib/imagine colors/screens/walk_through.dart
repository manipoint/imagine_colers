import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/helper/constent.dart';
import 'package:imagine_colers/imagine%20colors/helper/loading.dart';
import 'package:imagine_colers/imagine%20colors/providers/auth_provider.dart';
import 'package:imagine_colers/imagine%20colors/screens/dashboard_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class ICWalkThroughScreen extends StatefulWidget {
  static String tag = '/walkThroughScreen';
  @override
  _ICWalkThroughScreenState createState() => _ICWalkThroughScreenState();
}

class _ICWalkThroughScreenState extends State<ICWalkThroughScreen> {
  PageController _controller = PageController();
  int currentPage = 0;
  static const _duration = const Duration(seconds: 1);
  static const _curve = Curves.ease;

  @override
  void initState() {
    super.initState();
    changeStatusColor(Colors.transparent);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (i) {
              currentPage = i;
              setState(() {});
            },
            children: [
              Column(
                children: [
                  // Image.asset(
                  //     ICWalkThroughImg1, context.height() * 0.7,
                  //     width: context.width(), fit: BoxFit.cover),
                  Image.asset(
                    ICWalkThroughImg1,
                    height: context.height() * 0.7,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ),
                  16.height,
                  Text(
                    ICWalkThroughTitle1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: ICAppTextColorPrimary),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(ICWalkThroughSubTitle1,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ICAppTextColorSecondary)),
                  ),
                ],
              ),
              Column(
                children: [
                  // commonCacheImageWidget(
                  //     ICWalkThroughImg2, context.height() * 0.7,
                  //     width: context.width(), fit: BoxFit.cover),
                  Image.asset(
                    ICWalkThroughImg2,
                    height: context.height() * 0.7,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ),
                  16.height,
                  Text(
                    ICWalkThroughTitle2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: ICAppTextColorPrimary),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(ICWalkThroughSubTitle2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ICAppTextColorSecondary)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  // commonCacheImageWidget(
                  //     ICWalkThroughImg3, context.height() * 0.7,
                  //     width: context.width(), fit: BoxFit.cover),
                  Image.asset(
                    ICWalkThroughImg3,
                    height: context.height() * 0.7,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ),
                  16.height,
                  Text(
                    ICWalkThroughTitle2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: ICAppTextColorPrimary),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(ICWalkThroughSubTitle3,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ICAppTextColorSecondary)),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
              bottom: 90,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentPage,
                  decorator: DotsDecorator(
                      color: ICGreyColor.withOpacity(0.5),
                      activeColor: ICColorPrimary,
                      size: Size.square(9.0),
                      activeSize: Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              )),
          Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {
                      finish(context);
                      AppPagesController().launch(context);
                      // ICLoginScreen().launch(context);
                    },
                    child: Text('Skip',
                        style: TextStyle(color: ICAppTextColorSecondary)),
                  ),
                  FlatButton(
                    onPressed: () {
                      _controller.nextPage(duration: _duration, curve: _curve);
                    },
                    child: Text(ICBtnNext,
                        style: TextStyle(color: ICAppTextColorSecondary)),
                  )
                ],
              ).visible(currentPage != 2,
                  defaultWidget: Container(
                    margin: EdgeInsets.only(),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 250,
                        height: 40,
                        child: RaisedButton(onPressed: () {
                          finish(context);
                          ICLoginScreen().launch(context);
                          AppPagesController().launch(context);
                        }),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}

class AppPagesController extends StatelessWidget {
  // const AppPagesController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        //checking errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("SomeThing went Wrong")],
            ),
          );
        }
        //show application
        if (snapshot.connectionState == ConnectionState.done) {
          print(authProvider.status.toString());
          switch (authProvider.status) {
            case Status.Uninitialized:
              return Loading();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return ICLoginScreen();
            case Status.Authenticated:
              return ICDashedBoardScreen();
          }
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
