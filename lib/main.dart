import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imagine_colers/imagine%20colors/providers/spacialist_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'imagine colors/providers/auth_provider.dart';
import 'imagine colors/providers/product_provider.dart';
import 'imagine colors/screens/splash_screen.dart';
import 'main util/store/AppStore.dart';
import 'main util/utils/AppConstant.dart';
import 'main util/utils/AppTheme.dart';

AppStore appStore = AppStore();

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  appStore.toggleDarkMode(value: await getBool(isDarkModeOnPref));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: AuthProvider.initialize(),
    ),
      ChangeNotifierProvider.value(
      value: ICProductProviders.initialize(),
    ),
    ChangeNotifierProvider.value(
      value: IcSpecialistProvider.initialize(),),
  ], child: MyApp()));
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
        home: ICSplashScreen(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
      ),
    );
  }
}
