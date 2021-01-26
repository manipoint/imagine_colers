import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_constent.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_dataProvider.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_images.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:imagine_colers/main%20util/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ICDetailScreen extends StatefulWidget {
  static String tag = '/DetailScreen';
  @override
  _ICDetailScreenState createState() => _ICDetailScreenState();
}

class _ICDetailScreenState extends State<ICDetailScreen> {
  int _radioVal = 0;
  TabController tabController;

  List<ICGalleryModel> galleryList;
  List<ICCategoryModel> categoryList;
  List<ICOfferModel> offerList;
  List<ICServicesModel> servicesList;
  List<ICReviewModel> reviewList;
  List<ICStyleModel> styleModelList;
  List<ICBoardStyleModel> boardStyleModel;

  @override
  void initState() {
    super.initState();
    galleryList = getGalleryList();
    categoryList = getCategory();
    offerList = getOfferList();
    servicesList = getServicesList();
    reviewList = getReviewList();
    styleModelList = getStyleList();
    boardStyleModel = getBoardStyleList();
  }

  void someValue(int val) {
    setState(() {
      _radioVal = val;
      print(_radioVal);
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                Container(
                  child: SliverAppBar(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: white,
                      ),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    backgroundColor: ICColorPrimary,
                    pinned: true,
                    elevation: 2,
                    expandedHeight: 300,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      titlePadding: EdgeInsets.all(10),
                      background: Stack(
                         clipBehavior: Clip.antiAliasWithSaveLayer,
                    
                        children: [
                          Image.asset(
                            ICWall4,
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 35),
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Marguerite Cross',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                              color: whiteColor, fontSize: 16),
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.star,
                                                color: ICColorPrimary),
                                            onPressed: () {})
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Day Salon',
                                        style: TextStyle(
                                            color: whiteColor, fontSize: 16),
                                        textAlign: TextAlign.left),
                                    Container(
                                      height: 25,
                                      width: 65,
                                      margin: EdgeInsets.only(right: 16),
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Text(ICBtnOpen,
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 14)),
                                        color: ICColorPrimary,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      centerTitle: true,
                    ),
                    bottom: TabBar(
                      controller: tabController,
                      labelColor: whiteColor,
                      unselectedLabelColor: whiteColor,
                      isScrollable: true,
                      indicatorColor: ICColorPrimary,
                      tabs: [
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(ICTabAbout,
                                  style: TextStyle(fontSize: 14))),
                        ),
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(ICTabGallery,
                                  style: TextStyle(fontSize: 14))),
                        ),
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(ICTabServices,
                                  style: TextStyle(fontSize: 14))),
                        ),
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(ICTabReview,
                                  style: TextStyle(fontSize: 14))),
                        ),
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(ICTabBoradSpecialList,
                                  style: TextStyle(fontSize: 14))),
                        ),
                      ],
                    ),
                    actions: [
                      //TODO Active call and message
                      IconButton(icon: Icon(Icons.call, color: whiteColor, size: 16), onPressed: () {}),
                    IconButton(icon: Icon(Icons.message, color: whiteColor, size: 16), onPressed: () {}),
                  
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                aboutWidget(),
                galleryWidget(),
                serviceWidget(),
                reviewWidget(),
                specialListsWidget(),
              ],
            ),
          ),
        ));
  }
  Widget aboutWidget() {
      return Container(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
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
                child: Column(
                  children: [
                    Text(
                      ICTxtInformation,
                      style: TextStyle(
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Text(ICDetailTitle,
                        style: TextStyle(
                            color: ICAppTextColorSecondary, fontSize: 14)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ICTxtContact,
                      style: TextStyle(
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          size: 16,
                        ),
                        8.width,
                        Text('+923209509822',
                            style: TextStyle(
                                color: ICAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.web, size: 16),
                        8.width,
                        Text('www.imaginecolors.com',
                            style: TextStyle(
                                color: ICAppTextColorSecondary, fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ICTxtOpeningTime,
                      style: TextStyle(
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Saturday - Thursday',
                              style:
                                  TextStyle(color: ICGreyColor, fontSize: 14)),
                          Column(
                            children: [
                              Text('7:30 - 19:30',
                                  style: TextStyle(
                                      color: ICAppTextColorSecondary,
                                      fontSize: 14)),
                            
                            ],
                          )
                        ]),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Friday',
                            style: TextStyle(color: ICGreyColor, fontSize: 14)),
                        Text('7:30 - 11:30',
                            style: TextStyle(
                                color: ICAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ICTxtAddress,
                      style: TextStyle(
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.width,
                    Text('Main Buldia raod Chishtian,Punjab,Pakistan.',
                        style: TextStyle(color: ICColorPrimary, fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget galleryWidget() {
      return StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: galleryList.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Image.asset(
            galleryList[index].img,
            fit: BoxFit.cover,
          ),
        ),
        staggeredTileBuilder: (index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      );
    }

    Widget serviceWidget() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          categoryList[index].img,
                          height: 40,
                          width: 40,
                        ),
                        8.height,
                        Text(categoryList[index].categoryName,
                            style: TextStyle(
                                color: ICAppTextColorSecondary, fontSize: 14))
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(ICTxtPackageOffers,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ICAppTextColorPrimary)),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: offerList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    margin: EdgeInsets.all(8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: ICGreyColor.withOpacity(.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: commonCacheImageWidget(
                                offerList[index].img, 180,
                                width: 250, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              offerList[index].offerName,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ICAppTextColorPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 8, right: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  offerList[index].offerDate,
                                  style: TextStyle(
                                      color: ICAppTextColorSecondary,
                                      fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'RS ${offerList[index].offerOldPrice}',
                                      style: TextStyle(
                                          color: ICAppTextColorSecondary,
                                          fontSize: 14,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    8.width,
                                    Text(
                                      'Rs ${offerList[index].offerNewPrice}',
                                      style: TextStyle(
                                          color: ICColorPrimary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Text(ICTxtPopularServices,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ICAppTextColorPrimary)),
            ),
            ListView.builder(
              itemCount: servicesList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
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
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: commonCacheImageWidget(
                            servicesList[index].img, 80,
                            width: 80, fit: BoxFit.cover),
                      ),
                      8.width,
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              servicesList[index].serviceName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ICAppTextColorPrimary,
                                  fontSize: 14),
                            ),
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(
                                servicesList[index].time,
                                style: TextStyle(
                                    color: ICAppTextColorSecondary,
                                    fontSize: 14),
                              ),
                              8.width,
                              Text(
                                'RS ${servicesList[index].price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: ICColorPrimary),
                              ),
                            ],
                          ),
                        ],
                      ).expand(),
                      Radio(
                        value: servicesList[index].radioVal,
                        groupValue: _radioVal,
                        onChanged: (val) => someValue(val),
                        activeColor: ICColorPrimary,
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RaisedButton(
                padding: EdgeInsets.all(12),
                color: ICColorPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  //TODO
                  //ICPackageOfferScreen()
                },
                child: Text(ICBtnBookAppointment,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      );
    }

  Widget specialListsWidget() {
      return Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ICTxtBoardSpecialLists, style: TextStyle(color: ICAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                height: 180,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: styleModelList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                      shadowColor: ICGreyColor.withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child:commonCacheImageWidget(styleModelList[index].img, 110, width: 120, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              styleModelList[index].name,
                              style: TextStyle(fontSize: 14, color: ICAppTextColorSecondary),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(ICTxtBestSpecialists, style: TextStyle(color: ICAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                height: 180,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: boardStyleModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                      shadowColor: ICGreyColor.withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: commonCacheImageWidget(styleModelList[index].img, 110, width: 120, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              boardStyleModel[index].name,
                              style: TextStyle(fontSize: 14, color: ICAppTextColorSecondary),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }


    Widget reviewWidget() {
      return Container(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: ICGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Column(
                  children: [
                    Text(
                      ICTxtReview,
                      style: TextStyle(
                        fontSize: 16,
                        color: ICAppTextColorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    8.height,
                    Text(
                      ICTxtReviewMsg,
                      style: TextStyle(fontSize: 14, color: ICGreyColor),
                    ),
                    8.height,
                    RatingBar(
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                      initialRating: 1.5,
                      glow: true,
                      glowColor: ICGreyColor,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      allowHalfRating: true,
                      minRating: 1,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: ICColorPrimary,
                      ),
                    ),
                    8.height,
                    Row(
                      children: [
                        Container(
                          height: 45,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Say something...',
                              hintStyle: TextStyle(color: ICGreyColor),
                              filled: true,
                              fillColor: ICGreyColor.withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                            ),
                          ),
                        ).expand(),
                        8.width,
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: ICColorPrimary,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: reviewList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 0),
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: whiteColor, boxShadow: [
                      BoxShadow(
                        color: ICGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0,
                      ),
                    ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(reviewList[index].img),
                              radius: 30,
                            ),
                            8.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reviewList[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ICAppTextColorPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                8.height,
                                Text(
                                  reviewList[index].day,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ICGreyColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ).expand(),
                            Row(
                              children: [
                                Text(
                                  reviewList[index].rating.toString(),
                                  style: TextStyle(
                                    color: ICAppTextColorSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                                8.width,
                                Icon(
                                  Icons.star,
                                  color: ICColorPrimary,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          reviewList[index].review,
                          style: TextStyle(
                            color: ICAppTextColorSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }



}
