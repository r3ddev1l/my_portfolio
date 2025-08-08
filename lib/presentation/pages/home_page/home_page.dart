import 'package:flutter/material.dart';
import 'package:portfolio/core/responsive.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/presentation/pages/home_page/components/home_page_large.dart';
import 'package:portfolio/presentation/pages/home_page/components/home_page_small_medium.dart';
import 'package:portfolio/providers/locale_providers.dart';
import 'package:portfolio/providers/theme_providers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {
        final loc = AppLocalizations.of(context)!;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(loc.srijanMaharjanPortfolio),
            actions: [
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) {
                  return IconButton(
                    icon: Icon(
                      themeProvider.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                    tooltip: themeProvider.isDarkMode
                        ? loc.darkMode
                        : loc.lightMode,
                    onPressed: () => themeProvider.toggleTheme(),
                  );
                },
              ),
            ],
          ),
          body: ResponsiveLayout(
            builder: (context, screenSize) {
              final padding = getResponsivePadding(context);
              final fontScale = getFontScale(context);

              Widget content;

              if (screenSize == ScreenSize.large) {
                content = HomeScreenBodyLarge(
                  padding: padding,
                  fontScale: fontScale,
                );
              } else {
                content = HomeScreenBodySmallMedium(
                  padding: padding,
                  fontScale: fontScale,
                  screenSize: screenSize,
                );
              }

              return Center(child: content);
            },
          ),
        );
      },
    );
  }
}
