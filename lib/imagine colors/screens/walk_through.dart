import 'package:flutter/material.dart';
import 'package:imagine_colers/main%20util/utils/AppWidget.dart';

class ICWalkThroughScreen extends StatefulWidget {
  static String tag = '/walkThroughScreen';
  @override
  _ICWalkThroughScreenState createState() => _ICWalkThroughScreenState();
}

class _ICWalkThroughScreenState extends State<ICWalkThroughScreen> {
  PageController _controller = PageController();
  int currentPage = 0;
  static const _duration = const Duration(seconds: 1);
  static const _curve = Curves.ease;

  @override
  void initState() {
    super.initState();
    changeStatusColor(Colors.transparent);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (i) {
              currentPage = i;
              setState(() {});
            },
            children: [
              Column(
                children: [
                 // commonCacheImageWidget(ICWalkThroughImg1, context.height() * 0.7, width: context.width(), fit: BoxFit.cover),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
