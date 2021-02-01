import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/providers/auth_provider.dart';
import 'package:imagine_colers/imagine%20colors/screens/detail_screen.dart';
import 'package:imagine_colers/imagine%20colors/screens/notification_screen.dart';
import 'package:imagine_colers/imagine%20colors/screens/spacialist_screen.dart';
import 'package:imagine_colers/imagine%20colors/screens/specialOffer_screen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_dataProvider.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:provider/provider.dart';

class ICDiscoverScreen extends StatefulWidget {
  @override
  _ICDiscoverScreenState createState() => _ICDiscoverScreenState();
}

class _ICDiscoverScreenState extends State<ICDiscoverScreen> {
  List<ICBestSpecialModel> specialList;
  List<ICSpecialOfferModel> bestOffer;
  List<ICBestSpecialModel> bestNewList;
  List<ICSpecialOfferModel> offerNewList;

  @override
  void initState() {
    super.initState();
    specialList = getSpecialList();
    bestOffer = getSpecialOfferList();
    bestNewList = getSpecialNewList();
    offerNewList = getSpecialOfferNewList();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ICColorPrimary),
                  ),
                  Text(
                    userProvider.userModel?.name ?? 'loading ...',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ICColorPrimary),
                  ),
                  GestureDetector(
                    child: Icon(Icons.notifications,
                        color: ICColorPrimary, size: 28),
                    onTap: () {
                      ICNotificationScreen().launch(context);
                    },
                  ),
                ],
              ),
              16.height,
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 18,
                  ),
                  4.width,
                  Text("Buldia road chishtian,punjab,Pakistan",
                      style: TextStyle(
                          fontSize: 16, color: ICAppTextColorSecondary)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: TextFormField(
                          autocorrect: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            hintText: 'Find service near you',
                            prefixIcon: Icon(
                              Icons.search,
                              color: ICGreyColor,
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: ICAppDividerColor, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: ICAppDividerColor, width: 0.5),
                            ),
                          ),
                        )),
                  ),
                  8.width,
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 14),
                    height: 45,
                    child: Icon(
                      Icons.filter_list,
                      color: ICGreyColor,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border:
                            Border.all(color: ICAppDividerColor, width: .5)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ICTxtBestSpecialists,
                      style: TextStyle(
                          fontSize: 16,
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      sendTextData(context);
                    },
                    child: Text(ICTxtViewAll,
                        style: TextStyle(
                            fontSize: 14,
                            color: ICColorPrimary,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                height: 210,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: specialList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                      
                        ICDetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(8, 8, 16, 8),
                        shadowColor: ICGreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10)),
                              //TODO change picture
                              child: commonCacheImageWidget(
                                  specialList[index].img, 100,
                                  width: 200, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                specialList[index].title,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ICAppTextColorPrimary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                specialList[index].subTitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ICAppTextColorSecondary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ICTxtBoardSpecialLists,
                    style: TextStyle(
                        fontSize: 16,
                        color: ICAppTextColorPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendTextData(context);
                    },
                    child: Text(
                      ICTxtViewAll,
                      style: TextStyle(
                          fontSize: 14,
                          color: ICColorPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: bestNewList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ICDetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                        shadowColor: ICGreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Container(
                                child: commonCacheImageWidget(
                                    bestNewList[index].img, 160,
                                    width: 140, fit: BoxFit.cover),
                              ),
                            ),
                            8.height,
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bestNewList[index].title,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ICAppTextColorPrimary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  4.height,
                                  Text(
                                    bestNewList[index].subTitle,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: ICAppTextColorSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ICTxtPopularServices,
                      style: TextStyle(
                          fontSize: 16,
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      sendTextDataOffer(context);
                    },
                    child: Text(ICTxtViewAll,
                        style: TextStyle(
                            fontSize: 14,
                            color: ICColorPrimary,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                    itemCount: offerNewList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          ICDetailScreen().launch(context);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                          shadowColor: ICGreyColor.withOpacity(0.3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: commonCacheImageWidget(
                                    offerNewList[index].img, 100,
                                    width: 200, fit: BoxFit.cover),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  offerNewList[index].title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ICAppTextColorPrimary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 8, left: 8, bottom: 8),
                                child: Text(offerNewList[index].subtitle,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ICAppTextColorSecondary)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendTextData(BuildContext context) {
    String textData = 'Best SpecialLists';
    ICSpecialListViewAllScreen(
      specialList: textData,
    ).launch(context);
  }

  void sendTextDataOffer(BuildContext context) {
    String sendOfferText = 'Special Offer';
    ICSpecialOfferViewAllScreen(
      offerData: sendOfferText,
    ).launch(context);
  }
}
