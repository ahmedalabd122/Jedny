import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jedny/models/contactModel.dart';
import 'package:jedny/models/missedPersonModel.dart';
import '../widgets/jedny_textfield.dart';
import 'img_picker.dart';
import 'dart:io';
import 'request.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../widgets/datePicker.dart';

class MissedForm extends StatefulWidget {
  MissedForm({Key? key, required this.missed_image}) : super(key: key);
  XFile missed_image;
  @override
  State<MissedForm> createState() => _MissedFormState();
}

class _MissedFormState extends State<MissedForm> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<FormState>();
  late String name;
  late String age;
  late String location;
  late String physicalStatus;
  late String mentalStatus;
  late XFile image;
  //late Contact contact;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phyiscalController = TextEditingController();
  TextEditingController mentalController = TextEditingController();
  late MissedPerson missedPerson;
  _register() {
    missedPerson = MissedPerson(
      date: DateTime.now().toString(),
      image: widget.missed_image,
      name: nameController.text,
      age: ageController.text,
      location: locationController.text,
      physicalState: phyiscalController.text,
      mentalState: mentalController.text,
      contact: Contact(),
    );
  }

  // Future _selectDate() async {
  //   DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: new DateTime.now(),
  //       firstDate: new DateTime(2016),
  //       lastDate: new DateTime(2019));
  //   if (picked != null) setState(() => _value = picked.toString());
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
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
              Image.file(File(widget.missed_image.path)),
              JednyTextField(
                controller: nameController,
                hint_value: 'اسم الشخص المفقود',
                icon: const Icon(
                  Icons.person,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyTextField(
                controller: ageController,
                hint_value: 'السن عندما فقد',
                icon: const Icon(
                  Icons.date_range,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyDatePicker(),
              JednyTextField(
                controller: locationController,
                hint_value: 'مكان الفقد',
                icon: const Icon(
                  Icons.place,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyTextField(
                controller: phyiscalController,
                hint_value: 'الحالة البدنية',
                icon: const Icon(
                  Icons.boy_sharp,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ),
              JednyTextField(
                controller: mentalController,
                hint_value: 'الحالة الذهنية',
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
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      _register();
                      //_image = File(_xFile!.path);
                      Navigator.pushNamed(context, '/missed_contact',
                          arguments: missedPerson);
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
/*
Request().makeCheckIn(
                        name: 'ahmed alabd',
                        age: '23',
                        location: 'tanta',
                        physicalStatus: 'tired boss',
                        mentalStatus: 'mad',
                        image: XFile("${widget.missed_image}"),
                      );
*/

/**
 * TextFormField(
    decoration: new InputDecoration(hintText: 'DOB'),
    maxLength: 10,
    validator: validateDob,
    onSaved: (String val) {
        strDob = val;
    },
    onTap: (){
        // Below line stops keyboard from appearing
        FocusScope.of(context).requestFocus(new FocusNode());

        // Show Date Picker Here

      },
),

Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019)
    );
    if(picked != null) setState(() => _value = picked.toString());
}
 */