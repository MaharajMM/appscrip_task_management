import 'package:appscrip_task_management/const/colors/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class Themes {
  static ThemeData get theme => FlexThemeData.light(
        scheme: FlexScheme.gold,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        primary: const Color(0xFFF9B72F), // Orange Yellow
        secondary: const Color(0xFF5A05BA), // Violet
        scaffoldBackground: AppColors.appWhite,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        blendLevel: 20,
        swapColors: true,
        tabBarStyle: FlexTabBarStyle.forBackground,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          inputDecoratorRadius: 8,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            // replace default CupertinoPageTransitionsBuilder with this
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,

        /// fontFamily: GoogleFonts.getFont('Lato').fontFamily,

        ///
      );
  static ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.deepBlue,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        primary: const Color(0xFFF9B72F), // Orange Yellow
        secondary: const Color(0xFF5A05BA), // Violet
        scaffoldBackground: const Color(0xFF000000), // Black
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        tabBarStyle: FlexTabBarStyle.forBackground,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          inputDecoratorRadius: 8,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            // replace default CupertinoPageTransitionsBuilder with this
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.getFont('Lato').fontFamily,
      );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
