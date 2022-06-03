import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/jedny_textfield.dart';
import 'img_picker.dart';

class FoundForm extends StatefulWidget {
  const FoundForm({Key? key}) : super(key: key);

  @override
  State<FoundForm> createState() => _FoundFormState();
}

class _FoundFormState extends State<FoundForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
          title: Transform(
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: const Text(
              "بيانات الشخص المفقود",
              style: TextStyle(),
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Image.asset(
                "img/Layer-1.png",
                height: 200,
              ),
              JednyTextField(
                hint_value: 'اسم الشخص المفقود',
                icon: const Icon(
                  Icons.person,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyTextField(
                hint_value: 'السن عندما فقد',
                icon: const Icon(
                  Icons.date_range,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyTextField(
                hint_value: 'مكان الفقد',
                icon: const Icon(
                  Icons.place,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyTextField(
                hint_value: 'تاريخ الفقد',
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyTextField(
                hint_value: 'الحالة البدنية',
                icon: const Icon(
                  Icons.boy_sharp,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyTextField(
                hint_value: 'اسم الشخص المفقود',
                icon: const Icon(
                  Icons.psychology_rounded,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('متابعة'),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
