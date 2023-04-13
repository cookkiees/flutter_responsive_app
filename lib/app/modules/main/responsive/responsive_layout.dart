import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key,
      required this.tiny,
      required this.phone,
      required this.tablet,
      required this.largeTablet,
      required this.desktop});

  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget desktop;

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 270;
  static const int phoneLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1100;
  static const int desktopLimit = 1920;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < tinyLimit ||
            constraints.maxHeight < tinyHeightLimit) {
          return tiny;
        }
        if (constraints.maxWidth < phoneLimit) {
          return phone;
        }
        if (constraints.maxWidth < tabletLimit) {
          return tablet;
        }
        if (constraints.maxWidth < largeTabletLimit) {
          return largeTablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
