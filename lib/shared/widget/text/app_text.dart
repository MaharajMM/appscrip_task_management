//this is the textstyle of subtitle1
//! Don't use font sizes less than 16 because it is the least size visible to a user in a UI

import 'package:appscrip_task_management/const/colors/app_colors.dart';
import 'package:appscrip_task_management/const/app_constant.dart';
import 'package:appscrip_task_management/shared/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final Color secondaryColor;
  final FontWeight fontWeight;
  final double? letterSpacing;
  final double? fontSize;
  final TextAlign textAlign;
  final bool isStrikeThrough;
  final double? decorationThickness;
  final double? height;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final bool isSecondaryFont;
  final int? maxlines;

  final TextOverflow overflow;
  const AppText({
    super.key,
    required this.text,
    this.color = AppColors.grey900,
    this.secondaryColor = AppColors.grey800,
    this.fontWeight = FontWeight.w400,
    this.letterSpacing = 0.3,
    this.fontSize,
    this.textAlign = TextAlign.start,
    this.isStrikeThrough = false,
    this.decorationThickness = 0.5,
    this.height = 1.3,
    this.decorationColor,
    this.decorationStyle,
    this.decoration,
    this.isSecondaryFont = false,
    this.maxlines,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final isMobile = Responsive.isMobile(context);
    final double effectiveFontSize = fontSize ??
        (isMobile
            ? 12
            : isTablet
                ? AppConstants.tabletDefaultFontSize
                : AppConstants.desktopDefaultFontSize);
    return Text(
      text,
      style: isSecondaryFont
          ? GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
              fontSize: effectiveFontSize,
              color: secondaryColor,
            )
          : GoogleFonts.poppins(
              fontSize: effectiveFontSize,
              color: color,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
              decoration: isStrikeThrough ? TextDecoration.lineThrough : decoration,
              decorationThickness: decorationThickness,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
            ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxlines,
    );
  }
}
