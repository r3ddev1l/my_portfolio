import 'package:flutter/material.dart';
import 'package:portfolio/core/responsive.dart';
import 'package:portfolio/core/ui_helper.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/providers/locale_providers.dart';
import 'package:provider/provider.dart';

class HomeScreenBodySmallMedium extends StatelessWidget {
  const HomeScreenBodySmallMedium({
    super.key,
    required this.padding,
    required this.fontScale,
    required this.screenSize,
  });

  final EdgeInsets padding;
  final double fontScale;
  final ScreenSize screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.construction,
            size: screenSize == ScreenSize.medium ? 100 : 80,
          ),
          UIHelper.verticalSpaceMedium(context),
          Consumer<LocaleProvider>(
            builder: (context, localeProvider, _) {
              final loc = AppLocalizations.of(context)!;
              return Column(
                children: [
                  Text(
                    loc.comingSoon,
                    style: TextStyle(
                      fontSize: 24 * fontScale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(context),
                  Text(
                    loc.underConstruction,
                    style: TextStyle(fontSize: 16 * fontScale),
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpaceLarge(context),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          localeProvider.setLocale(Locale("en"));
                        },
                        child: Text("English"),
                      ),
                      UIHelper.horizontalSpaceMedium(context),
                      ElevatedButton(
                        onPressed: () {
                          localeProvider.setLocale(Locale("ne"));
                        },
                        child: Text("नेपाली"),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
