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
        PageView.custom(
          scrollDirection: Axis.horizontal,
          controller: controller,
          physics: AlwaysScrollableScrollPhysics(),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return FakeCard();
            },
            childCount: 3,
          ),
        ),
      ],
    ));
  }
}

class FakeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
//      decoration:
//          BoxDecoration(border: Border.all(color: Colors.red, width: 4)),
    );
  }
}

class TransformController {
  calculateTransform(double offset, int pageId) {
    double translationOffset = (pageId - offset) * 48;
    double scale = 1 - (pageId - offset) * 0.2;
    if (pageId - offset < 0) {
      translationOffset = (pageId - offset) * 500;
    }
    return Matrix4.identity()
      ..scale(scale)
      ..translate(translationOffset, 0, 0);
  }
}
