import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'request.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  XFile? _xFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                await ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  _xFile = value;
                });
                print(_xFile?.path);
                if (_xFile != null) {
                  setState(() {
                    //_image = File(_xFile!.path);
                  });
                }
              },
              child: const Text('pick'),
            ),
          )
        ],
      ),
    );
  }
}
// TextButton(
// onPressed: () {
// Request().makeCheckIn(
// name: 'ahmed alabd',
// age: '23',
// location: 'tanta',
// physicalStatus: 'tired boss',
// mentalStatus: 'mad',
// imagePath: PickedFile(
// "C:\Users\Ahmed Alabd\StudioProjects\Jedny\img\Layer-1.png"));
// },
// child: Text('asdasd'),
// ),
/**
 *   Request().makeCheckIn(
                          name: 'ahmed alabd',
                          age: '23',
                          location: 'tanta',
                          physicalStatus: 'tired boss',
                          mentalStatus: 'mad',
                          image: XFile("${_xFile?.path}"));
 */