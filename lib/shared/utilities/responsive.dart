import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 480;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 960 && MediaQuery.of(context).size.width >= 480;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < 1920 && MediaQuery.of(context).size.width >= 960;
  static bool isDesktop4k(BuildContext context) =>
      MediaQuery.of(context).size.width < double.infinity &&
      MediaQuery.of(context).size.width >= 1921;
}
