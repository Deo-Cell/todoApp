import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';


class TextInputField extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;
  final bool isEmail;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? suffixText;
  final bool enabled;
  final AutovalidateMode autovalidate;
  final bool readOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final double contentVert;
  final double contentHoriz;
  final double hintSize;
  final Function()? onTap;

  const TextInputField({
    super.key,
    this.label,
    this.controller,
    this.validator,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.obscureText = false,
    this.isEmail = false,
    this.onSaved,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixText,
    this.autovalidate = AutovalidateMode.onUserInteraction,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.maxLines = 1,
    this.contentVert = 2,
    this.contentHoriz = 2.0,
    this.hintSize = 12.0,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        color: kcGreyColor,
        width: 0,
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        color: kcGreyColor,
      ),
    );
    
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextFormField(
        cursorColor: kcPrimaryColor,
        maxLines: widget.maxLines,
        focusNode: focusNode,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        autofocus: widget.autofocus,
        autovalidateMode: widget.autovalidate,
        obscureText: widget.obscureText,
        inputFormatters: widget.inputFormatters,
        textAlign: widget.height == 75 ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: inputBorder,
          filled: true,
          fillColor: kcInputFillColors,
          focusedBorder: focusedBorder,
          enabledBorder: inputBorder,
          labelText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hintText ?? (widget.enabled ? null : 'N/A'),
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: widget.hintSize,
          ),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          suffixIconColor: Colors.white,
          // contentPadding: EdgeInsets.symmetric(
          //     vertical: widget.contentVert, horizontal: widget.contentHoriz),
          enabled: widget.enabled,
        ),
        style: TextStyle(
          color: widget.enabled ? Colors.black : Colors.black87,
          fontSize: 14,
        ),
        controller: widget.controller,
        validator: widget.enabled ? widget.validator : null,
        onSaved: widget.onSaved,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
      ),
    );
  }
}

class TextSpecialInputField extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final double? width;
  final double? height;
  final Color? fillColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;
  final bool isEmail;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? suffixText;
  final bool enabled;
  final AutovalidateMode autovalidate;
  final bool readOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final double contentVert;
  final double contentHoriz;
  final double hintSize;
  final Function()? onTap;

  const TextSpecialInputField({
    super.key,
    this.label,
    this.controller,
    this.validator,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.obscureText = false,
    this.isEmail = false,
    this.onSaved,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixText,
    this.autovalidate = AutovalidateMode.onUserInteraction,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.maxLines = 1,
    this.contentVert = 2,
    this.contentHoriz = 2.0,
    this.hintSize = 12.0,
    this.fillColor = kcBackgroundColor
  });

  @override
  State<TextSpecialInputField> createState() => _TextSpecialInputFieldState();
}

class _TextSpecialInputFieldState extends State<TextSpecialInputField> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(24.0),
      borderSide: const BorderSide(
        color: kcAppbarIconColor,
        width: 1,
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        color: kcAppbarIconColor,
      ),
    );
    
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        maxLines: widget.maxLines,
        focusNode: focusNode,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        autofocus: widget.autofocus,
        autovalidateMode: widget.autovalidate,
        obscureText: widget.obscureText,
        inputFormatters: widget.inputFormatters,
        textAlign: widget.height == 75 ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          border: inputBorder,
          filled: true,
          fillColor: widget.fillColor,
          focusedBorder: focusedBorder,
          enabledBorder: inputBorder,
          labelText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hintText ?? (widget.enabled ? null : 'N/A'),
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          suffixIconColor: Colors.white,
          enabled: widget.enabled,
        ),
        style: TextStyle(
          color: widget.enabled ? Colors.black : Colors.black87,
          fontSize: 14,
        ),
        controller: widget.controller,
        validator: widget.enabled ? widget.validator : null,
        onSaved: widget.onSaved,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
      ),
    );
  }
}