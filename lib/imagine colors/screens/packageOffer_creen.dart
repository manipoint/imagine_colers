import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_dataProvider.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'bookAppointment_screen.dart';

class ICPackageOfferScreen extends StatefulWidget {
  static String tag = '/PackageOffersScreen';
  @override
  _ICPackageOfferScreenState createState() => _ICPackageOfferScreenState();
}

class _ICPackageOfferScreenState extends State<ICPackageOfferScreen> {
  List<ICOfferModel> offerList;
  List<ICIncludeServiceModel> includeServiceList;
  @override
  void initState() {
    super.initState();
    offerList = getOfferList();
    includeServiceList = getIncludeServicesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            ICMug,
            height: 186,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: EdgeInsets.only(top: 176),
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Events",
                      style: TextStyle(
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Container(
                    height: 150,
                    child: ListView.builder(
                        //padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                        itemCount: offerList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                            shadowColor: ICGreyColor.withOpacity(0.3),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: commonCacheImageWidget(
                                      offerList[index].img, 140,
                                      width: 200, fit: BoxFit.cover),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        offerList[index].offerName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ICAppTextColorPrimary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(offerList[index].offerDate,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: ICAppTextColorSecondary)),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                            offerList[index]
                                                .offerOldPrice
                                                .toString(),
                                            style: TextStyle(
                                                color: ICAppTextColorPrimary,
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                            offerList[index]
                                                .offerNewPrice
                                                .toString(),
                                            style: TextStyle(
                                                color: ICColorPrimary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  16.height,
                  Text(ICTxtServicesInclude,
                      style: TextStyle(
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: includeServiceList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(0.0, 1.0),
                                blurRadius: 2.0)
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: commonCacheImageWidget(
                                  includeServiceList[index].serviceImg, 80,
                                  width: 80, fit: BoxFit.cover),
                            ),
                            8.width,
                            8.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  includeServiceList[index].serviceName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: ICAppTextColorPrimary),
                                ),
                                8.height,
                                Row(
                                  children: [
                                    Text(
                                      includeServiceList[index].time,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: ICAppTextColorSecondary),
                                    ),
                                    8.width,
                                    Text(
                                      'Rs ${includeServiceList[index].price.toString()}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: ICColorPrimary),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      onPressed: () {
                        
                        ICBookAppointmentScreen().launch(context);
                      },
                      color: ICColorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(ICBtnBookAppointment, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
