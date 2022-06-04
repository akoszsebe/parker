import 'package:flutter/material.dart';

class AppContainerBoxShadow extends BoxShadow {
  AppContainerBoxShadow()
      : super(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 3,
          offset: const Offset(0, 0),
        );
}
