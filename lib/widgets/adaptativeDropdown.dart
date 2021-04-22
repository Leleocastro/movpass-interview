import 'package:flutter/material.dart';

class AdaptativeDropdown extends StatelessWidget {
  final List list;
  final String labelText;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final String value;
  final void Function(String) onSaved;

  AdaptativeDropdown({
    @required this.list,
    @required this.labelText,
    @required this.onChanged,
    @required this.validator,
    this.value,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField(
        value: value,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: list.map((value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
