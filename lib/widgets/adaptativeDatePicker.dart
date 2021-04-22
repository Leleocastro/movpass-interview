import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'package:movpass_interview/constants.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;
  final String tipodeData;
  final bool isValid;

  const AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChanged,
    this.tipodeData,
    this.isValid,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(new Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        onDateChanged(pickedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5),
            top: BorderSide(width: 0.5),
            left: BorderSide(width: 0.5),
            right: BorderSide(width: 0.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  selectedDate == null
                      ? 'Selecione a Data'
                      : '$tipodeData: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  style: TextStyle(
                    color: isValid ? Colors.grey[600] : Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                child: Text(
                  'Selecionar Data',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.kPrimaryColor,
                  ),
                ),
                onPressed: () => _showDatePicker(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
