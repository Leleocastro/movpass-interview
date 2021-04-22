import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'package:movpass_interview/constants.dart';

class AdaptativeTimePicker extends StatelessWidget {
  final TimeOfDay selectedTime;
  final Function(TimeOfDay) onTimeChanged;
  final String tipodeData;
  final bool isValid;
  final String time;

  const AdaptativeTimePicker({
    this.selectedTime,
    this.onTimeChanged,
    this.tipodeData,
    this.isValid,
    this.time,
  });

  _showDatePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 00, minute: 00),
      initialEntryMode: TimePickerEntryMode.dial,
    ).then((picked) {
      if (picked == null) {
        return;
      } else {
        onTimeChanged(picked);
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
                  selectedTime == null
                      ? '$tipodeData'
                      : '$tipodeData: ${selectedTime.toString().split('(')[1].split(')')[0]}',
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
                  'Selecionar Horário',
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
