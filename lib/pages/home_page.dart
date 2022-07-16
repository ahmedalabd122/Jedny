// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jedny/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3030D0),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Spacer(flex: 4),
                Image.asset(
                  "assets/img/Logo.png",
                  scale: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "خلينا نلم الشمل",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                const Spacer(flex: 5),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'أريد أن أبلغ عن شخص مفقود',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: const Color(0xFFFFFFFF),
                        textColor: Color(0xff3030D0),
                        onPressed: () async {
                          if (missedSplashed) {
                            XFile? _xFile;
                            await ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              _xFile = value;
                            });
                            Navigator.pushNamed(context, '/missed_form',
                                arguments: _xFile);
                          } else {
                            Navigator.pushNamed(context, '/missed_splash');
                            missedSplashed = true;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'وجدت شخصا تائه؟',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: const Color(0xff1BD483),
                        textColor: const Color(0xFFFDFDFD),
                        onPressed: () async {
                          if (foundSplashed) {
                            XFile? _xFile;
                            await ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              _xFile = value;
                            });
                            Navigator.pushNamed(context, '/found_form',
                                arguments: _xFile);
                          } else {
                            Navigator.pushNamed(context, '/found_splash');
                            foundSplashed = true;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
              ]),
        ));
  }
}
