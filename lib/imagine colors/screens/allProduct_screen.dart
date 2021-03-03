import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/providers/product_provider.dart';
import 'package:imagine_colers/imagine%20colors/utilitis/ic_Colors.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';

class ICProductViewAllScreen extends StatefulWidget {
  static String tag = '/ProductViewAllScreen';

  final String specialList;

  ICProductViewAllScreen({this.specialList});

  @override
  ICProductViewAllScreenState createState() =>
      ICProductViewAllScreenState();
}

class ICProductViewAllScreenState
    extends State<ICProductViewAllScreen> {
  

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
    final productProvider = Provider.of<ICProductProviders>(context);
    return Container(
      // padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: productProvider.products.length,
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
                        productProvider.products[index].picture, 140,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      productProvider.products[index].name.capitalizeFirstLetter(),
                      style: TextStyle(
                          fontSize: 16,
                          color: ICAppTextColorPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                        "RS ${productProvider.products[index].price.toString()}",
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
}
