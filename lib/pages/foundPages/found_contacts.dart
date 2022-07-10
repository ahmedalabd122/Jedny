import 'package:flutter/material.dart';
import 'package:jedny/models/foundPersonModel.dart';
import 'package:jedny/pages/request.dart';
import 'package:jedny/widgets/jedny_textfield.dart';
import 'dart:typed_data';
import 'dart:io' as Io;

class FoundContact extends StatefulWidget {
  FoundContact({Key? key, required this.foundPerson}) : super(key: key);
  FoundPerson foundPerson;
  @override
  State<FoundContact> createState() => _FoundContactState();
}

class _FoundContactState extends State<FoundContact> {
  final formKey = GlobalKey<FormState>();
  late bool accepted;
  late String response;
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  register() async {
    widget.foundPerson.contact?.name = contactNameController.text;
    widget.foundPerson.contact?.phone = contactNumberController.text;

    Request request = Request(missed: false);
    await request.makeCheckIn(person: widget.foundPerson);
    accepted = request.accepted;
    if (accepted == false) {
      response = request.errorResponse.toString();
    }
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
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('تأكيد البلاغ'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() async {
                      await register();
                      if (accepted) {
                        Navigator.popAndPushNamed(context, '/success');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/success', (Route<dynamic> route) => false,
                            arguments: accepted);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error:  $response',
                            ),
                          ),
                        );
                      }
                    });
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
