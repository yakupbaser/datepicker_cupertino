library datepicker_cupertino;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerCupertino extends StatefulWidget {
  /// The function to be called if the selected date changes
  final void Function(DateTime) onDateTimeChanged;

  /// The text to be displayed if no initial value is given
  final String hintText;

  /// The style of the Text
  final TextStyle style;

  // The style of the HintText
  final TextStyle hintStyle;

  /// The background color of the cupertino picker
  final Color pickerBackgroundColor;

  /// The inner padding within the text box
  final double textfieldPadding;

  /// Specifies if the text box can be modified
  final bool enabled;

  /// Displays a cupertino picker to select a date if clicked
  const DatePickerCupertino({
    Key? key,
    this.style = const TextStyle(),
    required this.hintText,
    this.pickerBackgroundColor = CupertinoColors.systemBackground,
    this.textfieldPadding = 15.0,
    this.enabled = true,
    required this.onDateTimeChanged,
    this.hintStyle = const TextStyle(),
  }) : super(key: key);

  @override
  State<DatePickerCupertino> createState() => _DatePickerCupertinoState();
}

class _DatePickerCupertinoState extends State<DatePickerCupertino> {
  final double _kPickerSheetHeight = 250.0;

  DateTime? _currentDate;

  void callCallback() {
    widget.onDateTimeChanged(_currentDate ?? DateTime.now());
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      color: CupertinoColors.white,
      child: SafeArea(
        top: false,
        child: picker,
      ),
    );
  }

  void onSelectedDate(DateTime date) {
    setState(() {
      _currentDate = date;
    });
  }

  Widget _buildTextField(String hintText, Function onSelectedFunction) {
    String fieldText;

    if (_currentDate != null) {
      final formatter = DateFormat.yMd();
      fieldText = formatter.format(_currentDate!);
    } else {
      fieldText = hintText;
    }

    return Flexible(
        child: SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(
                width: 0.0, color: CupertinoColors.inactiveGray),
          ),
        ),
        onPressed: !widget.enabled
            ? null
            : () async {
                if (_currentDate == null) {
                  setState(() {
                    _currentDate = DateTime.now();
                  });
                }
                await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        backgroundColor: widget.pickerBackgroundColor,
                        initialDateTime: _currentDate,
                        onDateTimeChanged: (DateTime newDateTime) {
                          onSelectedFunction(newDateTime);
                          // call callback
                          callCallback();
                        }));
                  },
                );

                // call callback
                callCallback();
              },
        child: Text(
          fieldText,
          style: widget.style,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      _buildTextField(widget.hintText, onSelectedDate),
    ]);
  }
}
