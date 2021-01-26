import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';
import 'package:imagine_colers/imagine%20colors/screens/detail_screen.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_dataProvider.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class ICSpecialOfferViewAllScreen extends StatefulWidget {
  static String tag = '/SpecialOfferViewAllScreen';
  final String offerData;

  const ICSpecialOfferViewAllScreen({Key key, this.offerData})
      : super(key: key);
  @override
  _ICSpecialOfferViewAllScreenState createState() =>
      _ICSpecialOfferViewAllScreenState();
}

class _ICSpecialOfferViewAllScreenState
    extends State<ICSpecialOfferViewAllScreen> {
  List<ICSpecialOfferModel> specialOfferList;
  @override
  void initState() {
    super.initState();
    specialOfferList = getSpecialOfferList();
  }

  Widget specialListViewAllWidge() {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        padding: EdgeInsets.only(bottom: 16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
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
                    child: Image.asset(specialOfferList[index].img,
                        height: 100, width: 200, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      specialOfferList[index].title,
                      style: TextStyle(
                          fontSize: 16,
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      specialOfferList[index].title,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          widget.offerData,
          style: TextStyle(
              color: ICAppTextColorPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Wrap(
            runSpacing: 16,
            spacing: 16,
            children: specialOfferList.map((e){
              return GestureDetector(
                onTap: () {
                  ICDetailScreen().launch(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [BoxShadow(color: ICGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                            ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: commonCacheImageWidget(e.img, 390, width: 350, fit: BoxFit.cover),

                      ),
                         Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          e.title,
                          style: TextStyle(fontSize: 16, color: ICAppTextColorPrimary, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Text(e.subtitle, style: TextStyle(fontSize: 14, color: ICAppTextColorSecondary)),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
