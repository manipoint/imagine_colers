import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/providers/spacialist_provider.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

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
      body: specialListViewAllWidget(context),
    );
  }

  Widget specialListViewAllWidget(BuildContext context) {
    final specialistProvider = Provider.of<IcSpecialistProvider>(context);
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: specialistProvider.products.length,
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
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: commonCacheImageWidget(
                          specialistProvider.products[index].picture, 180,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover),
                    ),
                  ),
                
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      specialistProvider.products[index].name
                          .capitalizeFirstLetter(),
                      style: TextStyle(
                          fontSize: 16,
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 4),
                  for (int i = 0;
                      i < specialistProvider.products[index].profession.length;
                      i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 2,bottom: 4),
                      child: Text(
                        specialistProvider.products[index].profession[i]
                            .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: ICAppTextColorSecondary,
                        ),
                      ),
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
