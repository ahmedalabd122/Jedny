import 'package:flutter/material.dart';
import 'package:jedny/models/foundPersonModel.dart';
import 'package:jedny/services/found_request.dart';
import 'package:jedny/services/request.dart';
import 'package:jedny/theme.dart';
import 'package:jedny/widgets/jedny_textfield.dart';
import 'dart:typed_data';
import 'dart:io' as Io;

import 'package:lottie/lottie.dart';

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

    FoundRequest foundRequest = FoundRequest();
    await foundRequest.makeCheckIn(
      name: widget.foundPerson.name,
      age: widget.foundPerson.age,
      location: widget.foundPerson.location,
      physicalStatus: widget.foundPerson.physicalState,
      mentalStatus: widget.foundPerson.mentalState,
      image: widget.foundPerson.image,
      date: widget.foundPerson.date,
      contactName: contactNameController.text,
      contactphone: contactNumberController.text,
    );
    accepted = foundRequest.getAccepted();
    if (accepted == false) {
      response = foundRequest.getResponce();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Lottie.asset('assets/lottie/icon.json',
                                repeat: true, fit: BoxFit.fitHeight),
                          ),
                        );
                      },
                    );
                    await register();
                    Navigator.of(context).pop();
                    setState(() {
                      if (accepted) {
                        Navigator.popAndPushNamed(context, '/success');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/success', (Route<dynamic> route) => false,
                            arguments: accepted);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Container(
                                width: 300,
                                height: 300,
                                child: Center(
                                  child: Card(
                                    color: const Color(0xff1BD483),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        '!!! Error:  $response !!!',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff3030D0),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
