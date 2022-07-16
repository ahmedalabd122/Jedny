import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jedny/models/missedPersonModel.dart';
import 'package:jedny/services/missed_request.dart';
import 'package:jedny/services/request.dart';
import 'package:jedny/theme.dart';
import 'package:jedny/widgets/jedny_textfield.dart';
import 'dart:io' as Io;

import 'package:lottie/lottie.dart';

class MissedContact extends StatefulWidget {
  MissedContact({Key? key, required this.missedPerson}) : super(key: key);
  MissedPerson missedPerson;
  @override
  State<MissedContact> createState() => _MissedContactState();
}

class _MissedContactState extends State<MissedContact> {
  final formKey = GlobalKey<FormState>();
  late bool accepted;
  late String response;
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController contactRelationController = TextEditingController();
  MissedRequest missedRequest = MissedRequest();
  register() async {
    widget.missedPerson.contact?.name = contactNameController.text;
    widget.missedPerson.contact?.phone = contactNumberController.text;
    widget.missedPerson.contact?.relationship = contactRelationController.text;

    await missedRequest.makeCheckIn(
      name: widget.missedPerson.name,
      age: widget.missedPerson.age,
      location: widget.missedPerson.location,
      physicalStatus: widget.missedPerson.physicalState,
      mentalStatus: widget.missedPerson.mentalState,
      image: widget.missedPerson.image,
      date: widget.missedPerson.date,
      contactName: contactNameController.text,
      contactphone: contactNumberController.text,
      contactRealation: contactRelationController.text,
    );
    accepted = missedRequest.getAccepted();
    if (accepted == false) {
      response = missedRequest.getResponce();
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
                            '/success', (Route<dynamic> route) => false);
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
