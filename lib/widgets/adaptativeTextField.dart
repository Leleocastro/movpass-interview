import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final TextEditingController controller;
  final bool enabled;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final String Function(String) validator;
  final int maxLength;
  final int maxLines;
  final void Function(String) onChanged;
  final void Function(String) onSaved;

  AdaptativeTextField({
    @required this.labelText,
    this.controller,
    this.initialValue,
    @required this.enabled,
    this.textInputType,
    this.textCapitalization,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textInputAction: TextInputAction.next,
        autocorrect: true,
        enabled: enabled,
        controller: controller,
        validator: validator,
        keyboardType: textInputType,
        textCapitalization: textCapitalization,
        maxLength: maxLength,
        maxLines: maxLines,
      ),
    );
  }
}
