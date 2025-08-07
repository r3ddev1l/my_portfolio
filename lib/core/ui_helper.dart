import 'package:flutter/material.dart';

class UIHelper {
  // Vertical space as fraction of screen height
  static Widget verticalSpace(BuildContext context, double fraction) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(height: height * fraction);
  }

  // Horizontal space as fraction of screen width
  static Widget horizontalSpace(BuildContext context, double fraction) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * fraction);
  }

  // You can add some predefined commonly used spaces:

  static Widget verticalSpaceSmall(BuildContext context) =>
      verticalSpace(context, 0.01); // ~1% screen height

  static Widget verticalSpaceMedium(BuildContext context) =>
      verticalSpace(context, 0.02); // ~2%

  static Widget verticalSpaceLarge(BuildContext context) =>
      verticalSpace(context, 0.05); // ~5%

  static Widget horizontalSpaceSmall(BuildContext context) =>
      horizontalSpace(context, 0.01); // ~1% screen width

  static Widget horizontalSpaceMedium(BuildContext context) =>
      horizontalSpace(context, 0.02); // ~2%

  static Widget horizontalSpaceLarge(BuildContext context) =>
      horizontalSpace(context, 0.05); // ~5%
}
