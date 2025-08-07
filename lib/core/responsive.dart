import 'package:flutter/material.dart';
import 'package:portfolio/core/dimensions.dart';

/// Enum to define screen size categories
enum ScreenSize {
  small, // phones
  medium, // tablets
  large, // desktops
}

/// Returns the current screen size enum
ScreenSize getScreenSize(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) return ScreenSize.small;
  if (width < 1024) return ScreenSize.medium;
  return ScreenSize.large;
}

/// Responsive layout using LayoutBuilder for flexibility
class ResponsiveLayout extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenSize screenSize) builder;

  const ResponsiveLayout({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = getScreenSize(context);
        return builder(context, screenSize);
      },
    );
  }
}

/// Returns padding based on screen size
EdgeInsets getResponsivePadding(BuildContext context) {
  switch (getScreenSize(context)) {
    case ScreenSize.small:
      return const EdgeInsets.all(Dimensions.paddingSmall);
    case ScreenSize.medium:
      return const EdgeInsets.all(Dimensions.paddingMedium);
    case ScreenSize.large:
      return const EdgeInsets.symmetric(
        horizontal: 64.0,
        vertical: Dimensions.paddingLarge,
      );
  }
}

/// Returns font scaling multiplier based on screen size
double getFontScale(BuildContext context) {
  switch (getScreenSize(context)) {
    case ScreenSize.small:
      return 1.0;
    case ScreenSize.medium:
      return 1.1;
    case ScreenSize.large:
      return 1.25;
  }
}



/*
import 'package:flutter/material.dart';
import '../../core/responsive.dart';

ResponsiveLayout(
  builder: (context, screenSize) {
    final padding = getResponsivePadding(context);
    final fontScale = getFontScale(context);

    return Padding(
      padding: padding,
      child: Text(
        'Welcome!',
        style: TextStyle(fontSize: 24 * fontScale),
      ),
    );
  },
);
 */