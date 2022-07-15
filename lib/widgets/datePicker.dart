import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jedny/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class JednyDatePicker extends StatefulWidget {
  JednyDatePicker({Key? key, required this.dateController}) : super(key: key);
  TextEditingController dateController;

  @override
  State<JednyDatePicker> createState() => _JednyDatePickerState();
}

class _JednyDatePickerState extends State<JednyDatePicker> {
  String selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() => {
            //data.registrationdate = picked.toString(),
            widget.dateController.text = DateFormat('yyyy-MM-dd').format(picked)
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white12,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          cursorColor: primaryColor,
          readOnly: true,
          // focusNode: _focusNode,
          keyboardType: TextInputType.phone,
          autocorrect: false,
          textAlign: TextAlign.end,
          controller: widget.dateController,
          onSaved: (value) {
            //data.registrationdate = value;
          },
          onTap: () {
            _selectDate();
            FocusScope.of(context).requestFocus(FocusNode());
          },
          maxLines: 1,
          //initialValue: 'Aseem Wangoo',
          validator: (value) {
            if (value!.isEmpty || value.length < 1) {
              return 'أختر تاريخ الفقد';
            }
          },
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.calendar_today_rounded),
            iconColor: Colors.black54,
            hintText: 'اختر تاريخ الفقد',
            border: InputBorder.none,
            fillColor: Colors.black12,
            filled: true,
          ),
        ),
      ),
    );
  }
}
