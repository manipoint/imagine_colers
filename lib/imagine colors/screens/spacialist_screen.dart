import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_dataProvider.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'detail_screen.dart';

class ICSpecialListViewAllScreen extends StatefulWidget {
  static String tag = '/SpecialListViewAllScreen';

  final String specialList;

  ICSpecialListViewAllScreen({this.specialList});

  @override
  ICSpecialListViewAllScreenState createState() =>
      ICSpecialListViewAllScreenState();
}

class ICSpecialListViewAllScreenState
    extends State<ICSpecialListViewAllScreen> {
  List<ICBestSpecialModel> bestSpecialList;

  @override
  void initState() {
    super.initState();
    bestSpecialList = getSpecialList();
  }

  Widget specialListViewAllWidget() {
    return Container(
      // padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: bestSpecialList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //TODO
              ICDetailScreen().launch(context);
            },
            child: Container(
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
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: commonCacheImageWidget(
                        bestSpecialList[index].img, 110,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      bestSpecialList[index].title,
                      style: TextStyle(
                          fontSize: 16,
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(bestSpecialList[index].subTitle,
                        style: TextStyle(
                            fontSize: 14, color: ICAppTextColorSecondary)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(widget.specialList,
            style: TextStyle(
                color: ICAppTextColorPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back, color: blackColor),
        ),
      ),
      body: specialListViewAllWidget(),
    );
  }
}
