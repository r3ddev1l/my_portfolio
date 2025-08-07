import 'package:flutter/material.dart';
import 'package:portfolio/core/ui_helper.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/providers/locale_providers.dart';
import 'package:provider/provider.dart';

class HomeScreenBodyLarge extends StatelessWidget {
  const HomeScreenBodyLarge({
    super.key,
    required this.padding,
    required this.fontScale,
  });

  final EdgeInsets padding;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: padding,
            child: Consumer<LocaleProvider>(
              builder: (context, localeProvider, _) {
                final loc = AppLocalizations.of(context)!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.comingSoon,
                      style: TextStyle(
                        fontSize: 32 * fontScale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(context),
                    Text(
                      loc.underConstruction,
                      style: TextStyle(fontSize: 18 * fontScale),
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
          ),
        ),
        Expanded(
          child: Padding(
            padding: padding,
            child: Center(child: Icon(Icons.construction, size: 400)),
          ),
        ),
      ],
    );
  }
}
