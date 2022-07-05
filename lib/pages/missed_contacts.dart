import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jedny/models/contactModel.dart';
import 'package:jedny/models/missedPersonModel.dart';
import 'package:jedny/pages/request.dart';
import '../widgets/jedny_textfield.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io' as Io;

class MissedContact extends StatefulWidget {
  MissedContact({Key? key, required this.missedPerson}) : super(key: key);
  MissedPerson missedPerson;
  @override
  State<MissedContact> createState() => _MissedContactState();
}

class _MissedContactState extends State<MissedContact> {
  final formKey = GlobalKey<FormState>();

  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController contactRelationController = TextEditingController();
  _register() async {
    widget.missedPerson.contact.name = contactNameController.text;
    widget.missedPerson.contact.phone = contactNumberController.text;
    widget.missedPerson.contact.relationship = contactRelationController.text;
    print(widget.missedPerson.contact.name);
    print(widget.missedPerson.contact.phone);
    print(widget.missedPerson.contact.relationship);

    Io.File imageFile = Io.File(widget.missedPerson.image.path);
    Uint8List imagebytes = await imageFile.readAsBytes();
    String base64Encode = base64.encode(imagebytes);

    Request().makeCheckIn(
      name: widget.missedPerson.name,
      age: widget.missedPerson.age,
      location: widget.missedPerson.location,
      physicalStatus: widget.missedPerson.physicalState,
      mentalStatus: widget.missedPerson.mentalState,
      image: base64Encode,
      contact: widget.missedPerson.contact,
      date: widget.missedPerson.date,
    );
  }

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
            "معلومات الاتصال",
            style: TextStyle(),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 300,
                  child: const Text(
                    'نقوم باعلامك عبر اشعارات التطبيق وعبر رقم الهاتف الذي تدخله عند وجود أي معلومات أو تحديثات جديدة عن الشخص المفقود',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const Icon(
                  Icons.info_outline,
                  size: 36.0,
                  color: Colors.black54,
                ),
              ],
            ),
            JednyTextField(
              controller: contactNameController,
              hint_value: 'الاسم',
              icon: const Icon(
                Icons.person,
                size: 36.0,
                color: Colors.black54,
              ),
            ),
            JednyTextField(
              controller: contactNumberController,
              hint_value: 'رقم الهاتف',
              icon: const Icon(
                Icons.phone,
                size: 36.0,
                color: Colors.black54,
              ),
            ),
            JednyTextField(
              controller: contactRelationController,
              hint_value: 'العلاقة بالشخص المفقود',
              icon: const Icon(
                Icons.people,
                size: 36.0,
                color: Colors.black54,
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('تأكيد البلاغ'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _register();

                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    setState(() {
                      //_image = File(_xFile!.path);
                      //Navigator.pushNamed(context, '/missed_contact');
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                  //Navigator.popAndPushNamed(context, '/success');
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/success', (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/**
 * Request().makeCheckIn(
                          name: 'ahmed alabd',
                          age: '23',
                          location: 'tanta',
                          physicalStatus: 'tired boss',
                          mentalStatus: 'mad',
                          image: XFile("${widget.missed_image}"),
                          contact: );
 * 
 */