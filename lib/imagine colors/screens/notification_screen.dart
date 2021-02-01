import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_dataProvider.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/rendering.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ICNotificationScreen extends StatefulWidget {
  static String tag = '/ICNotificationScreen';
  @override
  _ICNotificationScreenState createState() => _ICNotificationScreenState();
}

class _ICNotificationScreenState extends State<ICNotificationScreen> {
  List<ICNotifyModel> notifyList;
  @override
  void initState() {
    super.initState();
    notifyList = getNotifyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: white,),
      body: SlidingUpPanel(
        panelBuilder: (ScrollController scrollController) =>
            _scrollList(scrollController),
        margin: EdgeInsets.symmetric(horizontal: 16),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
    );
  }

  Widget _scrollList(ScrollController scrollController) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  ICLocation,
                  width: 14,
                  height: 14,
                ),
                8.width,
                Text('Model town ,Lahore , Pakistan',
                    style:
                        TextStyle(fontSize: 14, color: ICAppTextColorSecondary))
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          hintText: "Find Services nearby..",
                          prefixIcon: Icon(
                            Icons.search,
                            color: ICGreyColor,
                            size: 20,
                          ),
                          hintStyle:
                              TextStyle(color: ICGreyColor, fontSize: 14),
                          filled: true,
                          fillColor: whiteColor.withOpacity(.7),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide:
                                BorderSide(color: ICAppDividerColor, width: .5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: ICAppDividerColor, width: .5))),
                    ),
                  ),
                ),
                8.width,
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    child: Icon(
                      Icons.cancel,
                      color: ICAppTextColorPrimary,
                    ),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ICAppDividerColor, width: 0.5),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
            16.height,
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: ICAppDividerColor,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifyList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: commonCacheImageWidget(notifyList[index].img, 60,
                          width: 90, fit: BoxFit.cover),
                    ),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notifyList[index].name,
                            style: TextStyle(
                                fontSize: 16,
                                color: ICAppTextColorPrimary,
                                fontWeight: FontWeight.bold)),
                        8.height,
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 14,
                              color: ICAppTextColorSecondary,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text(
                                notifyList[index].address,
                                style:
                                    TextStyle(fontSize: 12, color: ICGreyColor),
                              ),
                            ),
                          ],
                        ),
                        8.height,
                        Row(
                          children: [
                            Text(notifyList[index].rating.toString(),
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red)),
                                    Padding(
                                      padding: const EdgeInsets.only(left:4.0),
                                      child: Icon(Icons.star,size: 14,color: ICColorPrimary,),
                                    ),
                                    8.width,
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text('km',style: TextStyle(fontSize: 14,color: Colors.grey),),
                                    )
                          ],
                        )
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
