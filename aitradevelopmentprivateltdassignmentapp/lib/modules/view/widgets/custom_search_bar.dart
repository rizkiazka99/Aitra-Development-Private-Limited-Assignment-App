import 'package:aitradevelopmentprivateltdassignmentapp/core/colors.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/core/font_sizes.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final Key? formKey;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType input;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomSearchBar({
    super.key, 
    required this.formKey, 
    required this.autovalidateMode, 
    required this.controller, 
    this.obscureText = false, 
    this.input = TextInputType.text, 
    this.minLines = 1, 
    this.maxLines = 1,
    this.maxLength,
    required this.label,
    this.prefixIcon,
    this.suffixIcon, 
    required this.validator,
    this.onChanged
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autovalidateMode,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.input,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          hintText: widget.label,
          counterText: '',
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          prefixIconColor: Colors.black,
          suffixIconColor: Colors.black,
          errorMaxLines: 3,
          fillColor: searchBarColor,
          filled: true,
          hintStyle: bodyMd(
            color: secondaryColor.withOpacity(0.38),
            fontWeight: FontWeight.w500
          ),
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: searchBarColor
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: searchBarColor
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: contextRed,
              width: 2
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: contextRed,
              width: 2
            )
          )
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,
      )
    );
  }
}