import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/jedny_textfield.dart';
import 'img_picker.dart';
import 'dart:io';
import 'request.dart';
import 'package:image_picker/image_picker.dart';

class MissedForm extends StatefulWidget {
  MissedForm({Key? key, required this.missed_image}) : super(key: key);
  String missed_image;
  @override
  State<MissedForm> createState() => _MissedFormState();
}

class _MissedFormState extends State<MissedForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
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
              Image.file(File(widget.missed_image)),
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
                    /* if (formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    } */
                    setState(() {
                      //_image = File(_xFile!.path);
                      Request().makeCheckIn(
                          name: 'ahmed alabd',
                          age: '23',
                          location: 'tanta',
                          physicalStatus: 'tired boss',
                          mentalStatus: 'mad',
                          image: XFile("${widget.missed_image}"));
                      Navigator.pushNamed(context, '/missed_contact');
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
