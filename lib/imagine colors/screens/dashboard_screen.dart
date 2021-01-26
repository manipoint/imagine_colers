import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/screens/appontment_screen.dart';
import 'package:imagine_colers/imagine%20colors/screens/discover_screen.dart';
import 'package:imagine_colers/imagine%20colors/screens/message_screen.dart';
import 'package:imagine_colers/imagine%20colors/screens/notfy_screen.dart';
import 'package:imagine_colers/imagine%20colors/screens/profile_screen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';

class ICDashedBoardScreen extends StatefulWidget {
  @override
  _ICDashedBoardScreenState createState() => _ICDashedBoardScreenState();
}

class _ICDashedBoardScreenState extends State<ICDashedBoardScreen> {
  int _selectedIndex = 0;
  var _pages = <Widget>[
    ICDiscoverScreen(),
    ICNotifyScreen(),
    ICAppointmentScreen(),
    ICMessagesScreen(),
    ICProfileScreen(),
  ];
  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: ICColorPrimary),
      selectedItemColor: ICColorPrimary,
      unselectedLabelStyle: TextStyle(color: ICGreyColor),
      unselectedItemColor: ICGreyColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: ICBottomNavDiscover),
        BottomNavigationBarItem(
            icon: Icon(Icons.business), label: ICBottomNavNotify),
        BottomNavigationBarItem(
            icon: Icon(Icons.date_range), label: ICBottomNavAppointment),
        BottomNavigationBarItem(
            icon: Icon(Icons.message), label: ICBottomNavMessages),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: ICBottomNavProfile),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.white);
    return SafeArea(child: Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: Center(child: _pages.elementAt(_selectedIndex),),
    ));
  }

  void _onItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
