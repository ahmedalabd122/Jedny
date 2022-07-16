import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:jedny/models/contactModel.dart';
import 'package:jedny/models/foundPersonModel.dart';
import 'package:jedny/models/missedPersonModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jedny/theme.dart';
import 'package:jedny/widgets/datePicker.dart';
import 'package:jedny/widgets/jedny_textfield.dart';
import 'dart:io' as Io;

class FoundForm extends StatefulWidget {
  FoundForm({Key? key, required this.found_image}) : super(key: key);
  XFile found_image;
  @override
  State<FoundForm> createState() => _FoundFormState();
}

class _FoundFormState extends State<FoundForm> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phyiscalController = TextEditingController();
  TextEditingController mentalController = TextEditingController();

  FoundPerson foundPerson = FoundPerson();

  _register() async {
    Io.File imageFile = Io.File(widget.found_image.path);
    Uint8List imagebytes = await imageFile.readAsBytes();
    String base64Encode =
        Uri.dataFromBytes(imagebytes, mimeType: 'image/jpeg').toString();
    foundPerson.image = base64Encode;

    foundPerson = FoundPerson(
      date: dateController.text,
      image: foundPerson.image,
      name: nameController.text,
      age: int.parse(ageController.text),
      location: locationController.text,
      physicalState: phyiscalController.text,
      mentalState: mentalController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          "بيانات الشخص المفقود",
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.file(
                  Io.File(
                    widget.found_image.path,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      await ImagePicker()
                          .pickImage(source: ImageSource.gallery)
                          .then(
                        (value) {
                          widget.found_image = value!;
                        },
                      );
                      setState(() {});
                    },
                    child: Container(
                      width: 125,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: secondaryColor,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.photo_camera_rounded,
                              size: 20,
                            ),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          const Text(
                            'اختر صورة اخرى',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'NotoKufiArabic',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
              hint_value: 'السن عندما وجد',
              icon: const Icon(
                Icons.date_range,
                size: 36.0,
                color: Colors.black54,
              ),
            ),
            JednyDatePicker(dateController: dateController),
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await _register();
                    Navigator.pushNamed(context, '/found_contact',
                        arguments: foundPerson);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
