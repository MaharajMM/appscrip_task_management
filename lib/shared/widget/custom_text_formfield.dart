import 'package:appscrip_task_management/const/colors/app_colors.dart';
import 'package:appscrip_task_management/shared/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.suffix,
    this.isReadOnly = false,
    this.isErrorText = false,
    this.validator,
    required this.hintText,
    this.labelText,
    this.keyboardType,
    this.onTap,
    this.focusNode,
    this.onChanged,
    required this.name,
    this.textInputAction,
    this.controller,
    this.initialValue,
    this.minLine,
    this.maxLine,
    this.fillColor = AppColors.kTextfieldBgColor,
    this.enableBorderColor = AppColors.orangeYellow,
    this.focusedBorderColor = AppColors.orangeYellow,
    this.fontColor = AppColors.grey900,
    this.fontSize = 16,
    this.hintTexFontSize = 16,
    this.letterSpacing = 0.3,
    this.isFillColor = false,
    this.islabelText = true,
    this.scrollPhysics,
    this.isTextCapitalization = false,
    this.onFocusGained,
    this.borderRadius,
    this.contentPadding = 12,
    this.valueTransformer,
    this.inputFormatters,
  });

  final Widget? prefixIcon;
  final Widget? suffix;
  final bool isReadOnly;
  final bool? isErrorText;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final String name;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? initialValue;
  final int? minLine;
  final int? maxLine;
  final Color? fillColor;
  final Color enableBorderColor;
  final Color focusedBorderColor;
  final Color? fontColor;
  final double fontSize;
  final double? hintTexFontSize;
  final double? letterSpacing;
  final bool? isFillColor;
  final bool? islabelText;
  final ScrollPhysics? scrollPhysics;
  final bool isTextCapitalization;
  final VoidCallback? onFocusGained;
  final double? borderRadius;
  final double? contentPadding;
  final Function(String?)? valueTransformer;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && widget.onFocusGained != null) {
      widget.onFocusGained!();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return FormBuilderTextField(
      inputFormatters: widget.inputFormatters,
      scrollPhysics: widget.scrollPhysics,
      controller: widget.controller,
      name: widget.name,
      initialValue: widget.initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      readOnly: widget.isReadOnly,
      scrollPadding: const EdgeInsets.all(8),
      valueTransformer: widget.valueTransformer,
      style: GoogleFonts.poppins(
        fontSize: widget.fontSize,
        color: widget.isFillColor == false ? widget.fontColor : AppColors.kHintTextColor,
        letterSpacing: widget.letterSpacing,
        fontWeight: FontWeight.w400,
      ),
      enableSuggestions: true,
      enableInteractiveSelection: true,
      textCapitalization:
          widget.isTextCapitalization ? TextCapitalization.words : TextCapitalization.sentences,
      minLines: widget.minLine,
      maxLines: widget.maxLine,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(widget.contentPadding ?? 12),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffix,
        hintText: widget.hintText,
        labelText: widget.islabelText == true ? (widget.labelText ?? widget.hintText) : null,
        labelStyle: widget.islabelText == true
            ? GoogleFonts.poppins(
                fontSize: isTablet ? 18 : 14,
                color: AppColors.grey800,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
              )
            : null,
        // alignLabelWithHint: true,
        filled: widget.isFillColor,
        fillColor: widget.fillColor,
        hintStyle: GoogleFonts.poppins(
          fontSize: isTablet ? 18 : widget.hintTexFontSize ?? widget.fontSize,
          color: AppColors.grey900.withOpacity(0.5),
          fontWeight: FontWeight.w400,
        ),
        errorStyle: widget.isErrorText! ? const TextStyle(color: AppColors.kErrorColor) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.isFillColor == false ? widget.enableBorderColor : Colors.transparent,
            width: 0.6,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.isFillColor == false ? widget.focusedBorderColor : Colors.transparent,
            width: 0.6,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kErrorColor, width: 1.0),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kErrorColor, width: 1.0),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
        ),
      ),
    );
  }
}
