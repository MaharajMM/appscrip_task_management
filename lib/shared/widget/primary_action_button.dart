import 'package:appscrip_task_management/const/colors/app_colors.dart';
import 'package:appscrip_task_management/shared/utilities/responsive.dart';
import 'package:appscrip_task_management/shared/widget/text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    super.key,
    this.borderRadius,
    required this.labelText,
    required this.onPressed,
    this.isLoading = false,
    this.color = AppColors.violet,
    this.freeSize = false,
    this.fontSize,
    this.isCTA = false,
    this.icon = const Icon(Icons.download_rounded),
    this.isIcon = false,
    this.isButtonActive,
    this.borderColor,
    this.fontColor,
  });
  final BorderRadiusGeometry? borderRadius;
  final String labelText;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;
  final bool freeSize;
  final bool isCTA;
  final Widget? icon;
  final bool isIcon;
  final double? fontSize;
  final bool? isButtonActive;
  final Color? borderColor;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return isIcon
        ? ElevatedButton.icon(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(30),
                side: BorderSide(color: borderColor ?? Colors.transparent),
              ),
              backgroundColor: color,
              minimumSize: freeSize
                  ? const Size(0, 0)
                  : Size(isTablet ? MediaQuery.of(context).size.width * 0.5 : double.infinity, 55),
            ),
            icon: icon!,
            label: AppText(
              text: labelText.toUpperCase(),
              fontWeight: FontWeight.w600,
              color: fontColor ?? AppColors.grey200,
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              shape: isCTA
                  ? RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColors.violet.withOpacity(0.5),
                        width: 1.5,
                      ),
                      borderRadius: borderRadius ?? BorderRadius.circular(30),
                    )
                  : RoundedRectangleBorder(
                      borderRadius: borderRadius ?? BorderRadius.circular(30),
                    ),
              backgroundColor: isLoading ? AppColors.violet.withOpacity(0.3) : color,
              minimumSize: freeSize
                  ? const Size(0, 0)
                  : Size(isTablet ? MediaQuery.of(context).size.width * 0.5 : double.infinity, 45),
            ),
            child: <Widget>[
              if (isLoading) const CupertinoActivityIndicator(),
              AppText(
                text: labelText.allWordsCapitilize(),
                fontWeight: FontWeight.w600,
                color: fontColor ?? AppColors.grey200,
                fontSize: fontSize ?? (isTablet ? 16 : 14),
              ).pOnly(left: 5),
            ].hStack(alignment: MainAxisAlignment.center),
          );
  }
}
