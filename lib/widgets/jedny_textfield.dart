import 'dart:ui';

import 'package:flutter/material.dart';

class JednyTextField extends StatefulWidget {
  final String hint_value;
  final Widget icon;
  TextEditingController controller;
  bool readonly;
  JednyTextField(
      {Key? key,
      required this.hint_value,
      required this.icon,
      required this.controller,
      this.readonly = false})
      : super(key: key);

  @override
  State<JednyTextField> createState() => _JednyTextFieldState();
}

class _JednyTextFieldState extends State<JednyTextField> {
  String getValue(value) {
    return value;
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
          readOnly: widget.readonly,
          autofocus: true,
          textAlign: TextAlign.end,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.icon,
            iconColor: Colors.black54,
            hintText: widget.hint_value,
            border: InputBorder.none,
            fillColor: Colors.black12,
            filled: true,
          ),
          validator: (value) {
            if (value?.isEmpty == true) {
              return 'من فضلك أدخل ${widget.hint_value}';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
