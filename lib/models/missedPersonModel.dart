import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:jedny/models/contactModel.dart';

//DateTimeRange date =
//    DateTimeRange(start: DateTime(1990, 1, 1, 00, 00), end: DateTime.now());

class MissedPerson {
  final String name;
  final int age;
  final String location;
  String date;
  final String physicalState;
  final String mentalState;
  final XFile image;
  Contact? contact;
  MissedPerson({
    this.name = 'ahmed',
    this.age = 23,
    this.location = 'Tanta',
     this.date='',
    this.physicalState = 'good',
    this.mentalState = 'good',
    required this.image,
     this.contact,
  });
}
