import 'package:flutter/material.dart';

class JednyTextField extends StatefulWidget {
  final String hint_value;
  final Widget icon;
  JednyTextField({Key? key, required this.hint_value, required this.icon})
      : super(key: key);

  @override
  State<JednyTextField> createState() => _JednyTextFieldState();
}

class _JednyTextFieldState extends State<JednyTextField> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white12,
      ),
      child: TextFormField(
        autofocus: true,
        textAlign: TextAlign.end,
        controller: _textEditingController,
        decoration: InputDecoration(
          suffixIcon: widget.icon,
          iconColor: Colors.black54,
          hintText: widget.hint_value,
          border: InputBorder.none,
          fillColor: Colors.black12,
          filled: true,
        ),
      ),
    );
  }
}
