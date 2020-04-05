import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/components/styled_card.dart';

class CarouselWithState extends StatefulWidget {
  @override
  _CarouselWithStateState createState() => _CarouselWithStateState();
}

class _CarouselWithStateState extends State<CarouselWithState> {
  PageController controller;
  TransformController transformController = TransformController();
  double selectedPage = 0;
  void _scrollListener() {
    setState(() {
      selectedPage = controller.page;
    });
  }

  @override
  void initState() {
    controller = PageController(viewportFraction: 0.4);
    controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Center(
            child: Stack(
          children: <Widget>[
            Transform(
              alignment: Alignment.center,
              transform:
                  transformController.calculateTransform(selectedPage, 2),
              child: StyledCard(),
            ),
            Transform(
              alignment: Alignment.center,
              transform:
                  transformController.calculateTransform(selectedPage, 1),
              child: StyledCard(),
            ),
            Transform(
              alignment: Alignment.center,
              transform:
                  transformController.calculateTransform(selectedPage, 0),
              child: StyledCard(),
            ),
          ],
        )),
        Center(
          child: Container(
            height: 250,
            child: PageView.custom(
              scrollDirection: Axis.horizontal,
              controller: controller,
              physics: AlwaysScrollableScrollPhysics(),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (selectedPage == index) {
                    return StyledCard();
                  }
                  return Container();
                },
                childCount: 3,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class TransformController {
  calculateTransform(double offset, int pageId) {
    double translationOffset = (pageId - offset) * 48;
    double scale = 1 - (pageId - offset) * 0.2;

    if (pageId - offset < 0) {
      translationOffset = (pageId - offset) * 250;
    }
    return Matrix4.identity()
      ..scale(scale)
      ..translate(translationOffset, 0, 0);
  }
}
