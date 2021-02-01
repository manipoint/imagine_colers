import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';
import 'package:imagine_colers/imagine%20colors/screens/dashboard_screen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_dataProvider.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class ICNotifyScreen extends StatefulWidget {
  static String tag = '/NotificationScreen';
  @override
  _ICNotifyScreenState createState() => _ICNotifyScreenState();
}

class _ICNotifyScreenState extends State<ICNotifyScreen> {
  List<ICNotificationModel> notificationList = getNotificationList();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ICTxtNotification,
          style: TextStyle(
              color: ICAppTextColorPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: white,
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                finish(context);
                ICDashedBoardScreen().launch(context);
              }),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: notificationList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ICAppDividerColor, width: .6),
              color: whiteColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                commonCacheImageWidget(notificationList[index].img, 80,
                    width: 80, fit: BoxFit.cover),
                8.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notificationList[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              color: ICAppTextColorPrimary,
                              fontWeight: FontWeight.bold)),
                      8.height,
                      Text(notificationList[index].msg,
                          style: TextStyle(
                            fontSize: 12,
                            color: ICAppTextColorSecondary,
                          )),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(notificationList[index].status,
                        style: TextStyle(
                            fontSize: 12, color: ICAppTextColorSecondary)),
                    8.height,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        notificationList[index].callInfo,
                        color: ICColorPrimary,
                        height: 25,
                        width: 25,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
