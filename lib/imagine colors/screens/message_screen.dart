import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_dataProvider.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:nb_utils/nb_utils.dart';

import 'chat_screen.dart';

class ICMessagesScreen extends StatefulWidget {
  static String tag = '/MessagesBottomNavigationBarScreen';
  @override
  _ICMessagesScreenState createState() => _ICMessagesScreenState();
}

class _ICMessagesScreenState extends State<ICMessagesScreen> {
  List<MessageModel> messageList;
  List<ICCallModel> callList;

  @override
  void initState() {
    super.initState();
    messageList = getMessageList();
    callList = getCallList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelColor: ICColorPrimary,
          unselectedLabelColor: ICAppTextColorPrimary,
          indicatorColor: ICColorPrimary,
          onTap: (value) {},
          tabs: [
            Tab(
              child: Text(ICTabMessages, style: TextStyle(fontSize: 14)),
            ),
            Tab(
              child: Text(ICTabCalls, style: TextStyle(fontSize: 14)),
            )
          ],
        ),
        body: TabBarView(
          children: [
            chatMessagesWidget(),
            callsWidget(),
          ],
        ),
      ),
    );
  }

  Widget chatMessagesWidget() {
    return Container(
      color: ICGreyColor.withOpacity(0.1),
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: Expanded(
                    child: TextField(
                      autocorrect: true,
                      style: TextStyle(fontSize: 16.0, color: ICGreyColor),
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.search, color: ICGreyColor),
                        fillColor: whiteColor,
                        hintText: 'Search',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: whiteColor),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: whiteColor),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                16.width,
                Container(
                  child: Image.asset(
                    ICMessageIcon,
                    width: 30,
                    height: 30,
                    //color: ICColorPrimary,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: whiteColor),
                )
              ],
            ),
            16.height,
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      String img = messageList[index].img;
                      String name = messageList[index].name;
                      ICChatScreen(
                        img: img,
                        name: name,
                      ).launch(context);
                    },
                    child: Row(
                      children: [
                        messageList[index].img.validate().startsWith('https')
                            ? Image.network(messageList[index].img)
                            : CircleAvatar(
                                backgroundImage: AssetImage(
                                  messageList[index].img,
                                ),
                                radius: 25,
                              ),
                        8.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  messageList[index].name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ICAppTextColorPrimary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              8.height,
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(messageList[index].message,
                                    style: TextStyle(
                                        fontSize: 12, color: ICGreyColor)),
                              ),
                            ],
                          ),
                        ),
                        Text(messageList[index].lastSeen,
                            style: TextStyle(color: ICGreyColor, fontSize: 14)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      color: ICGreyColor.withOpacity(.3),
                      indent: 6,
                    ),
                itemCount: messageList.length)
          ],
        ),
      ),
    );
  }

  Widget callsWidget() {
    return Container(
      color: ICGreyColor.withOpacity(0.1),
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                autofocus: false,
                style: TextStyle(fontSize: 16.0, color: ICGreyColor),
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: ICGreyColor),
                  fillColor: whiteColor,
                  hintText: 'Search',
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: whiteColor), borderRadius: BorderRadius.circular(10)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: whiteColor), borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(color: ICGreyColor.withOpacity(0.3), indent: 5),
              physics: NeverScrollableScrollPhysics(),
              itemCount: callList.length,
              padding: EdgeInsets.only(top: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    callList[index].img.validate().startsWith('http') ? Image.network(callList[index].img,height: 50,width: 50,fit: BoxFit.cover).cornerRadiusWithClipRRect(25) : CircleAvatar(backgroundImage: AssetImage(callList[index].img), radius: 25),
                    8.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(callList[index].name, style: TextStyle(fontSize: 14, color: ICAppTextColorPrimary, fontWeight: FontWeight.bold)),
                          8.height,
                          Row(
                            children: [
                              Icon(callList[index].callImg, size: 14),
                              8.width,
                              Text(callList[index].callStatus, style: TextStyle(color: ICAppTextColorSecondary, fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset(callList[index].videoCallIcon, height: 40, width: 40),
                          onPressed: () {
                            //TODO Video Call Screen
                            //ICVideoCallingScreen().launch(context);
                          },
                        ),
                        IconButton(icon: Image.asset(callList[index].audioCallIcon, height: 40, width: 40), onPressed: () {})
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
