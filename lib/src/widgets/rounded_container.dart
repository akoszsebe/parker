import 'package:flutter/material.dart';

import 'app_container_box_shadow.dart';

// ignore: must_be_immutable
class RoundedContainer extends Container {
  RoundedContainer({
    required double radius,
    Widget? child,
    Key? key,
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
  }) : super(
            key: key,
            child: child,
            height: height,
            width: width,
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              boxShadow: [AppContainerBoxShadow()],
            ));
}

class TopRoundedContainer extends Container {
  TopRoundedContainer({
    required double radius,
    Widget? child,
    Key? key,
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
  }) : super(
            key: key,
            child: child,
            height: height,
            width: width,
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius)),
              boxShadow: [AppContainerBoxShadow()],
            ));
}
