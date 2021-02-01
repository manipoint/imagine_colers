import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:nb_utils/nb_utils.dart';

class ICAppointmentScreen extends StatefulWidget {
  static String tag = '/AppointmentBottomNavigationBarScreen';
  @override
  _ICAppointmentScreenState createState() => _ICAppointmentScreenState();
}

class _ICAppointmentScreenState extends State<ICAppointmentScreen> {
  bool isSwitched = false;
  DateTime dateTime;
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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: whiteColor,
          appBar: TabBar(
            labelColor: ICColorPrimary,
            unselectedLabelColor: ICAppTextColorPrimary,
            indicatorColor: ICColorPrimary,
            onTap: (value) {},
            tabs: [
              Tab(
                child: Text(
                  ICTabOngoing,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  ICTabHistory,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              onGoingAppointmentWidget(),
              historyAppointmentWidget(),
            ],
          ),
        ));
  }

  onGoingAppointmentWidget() {
    return Container(
      color: ICGreyColor,
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
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
                      blurRadius: 2.0),
                ],
              ),
              child: ListTile(
                title: Text(
                    'Date :${dateTime.day}/${dateTime.month}/${dateTime.year}',
                    style: TextStyle(color: ICAppTextColorSecondary)),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: ICAppTextColorSecondary,
                ),
                onTap: () => _pickDate(),
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(8),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          ICWalkThroughImg3,
                          height: 70,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Al-Madina Color leb',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ICAppTextColorPrimary,
                                  fontWeight: FontWeight.bold)),
                          8.height,
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Icon(Icons.location_on,
                                    size: 14, color: ICAppTextColorSecondary),
                              ),
                              Text('Buldia road Chishtian,punjab,Pakistan.',
                                  style: TextStyle(
                                      fontSize: 12, color: ICGreyColor)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cushion ',
                          style: TextStyle(
                              fontSize: 14,
                              color: ICAppTextColorPrimary,
                              fontWeight: FontWeight.bold)),
                      Text('1:30 - 2:30 PM',
                          style:
                              TextStyle(color: ICColorPrimary, fontSize: 14)),
                    ],
                  ),
                  8.height,
                  Row(
                    children: [
                      Icon(Icons.person,
                          size: 14, color: ICAppTextColorSecondary),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Sajid Khan',
                            style: TextStyle(
                                color: ICAppTextColorSecondary, fontSize: 14)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Scan Barcode',
                          style: TextStyle(
                              fontSize: 14, color: ICAppTextColorSecondary)),
                      Image.asset(ICBarCodeImg, height: 50, width: 120),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Remind me 1h in advance',
                          style: TextStyle(
                              fontSize: 14, color: ICAppTextColorPrimary)),
                      Transform.scale(
                        scale: .7,
                        child: CupertinoSwitch(
                          value: isSwitched,
                          activeColor: ICColorPrimary,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  historyAppointmentWidget() {
    return Container(
      color: ICGreyColor.withOpacity(0.1),
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
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
                        child: Image.asset(ICWalkThroughImg2,
                            height: 70, width: 130, fit: BoxFit.cover),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          4.height,
                          Text(
                            'IC Studio',
                            style: TextStyle(
                                fontSize: 14,
                                color: ICAppTextColorPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          8.height,
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 14, color: ICAppTextColorSecondary),
                              Text('Behria Town Karachi, Pakistan.',
                                  style: TextStyle(
                                      fontSize: 12, color: ICGreyColor)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  8.height,
                  Text('Wall decoration', style: TextStyle(fontSize: 14, color: ICAppTextColorPrimary, fontWeight: FontWeight.bold)),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, size: 14, color: ICAppTextColorSecondary),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text('Sajid Khan', style: TextStyle(color: ICAppTextColorSecondary, fontSize: 14)),
                          ),
                        ],
                      ),
                      Text('March 24, 2020', style: TextStyle(color: ICAppTextColorPrimary, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
