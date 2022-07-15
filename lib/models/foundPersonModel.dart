import 'package:image_picker/image_picker.dart';
import 'package:jedny/models/contactModel.dart';

class FoundPerson {
  final String name;
  final int age;
  final String location;
  String date;
  final String physicalState;
  final String mentalState;
  String image;
  Contact? contact;
  FoundPerson({
    this.name = 'ahmed',
    this.age = 23,
    this.location = 'Tanta',
    this.date = '',
    this.physicalState = 'good',
    this.mentalState = 'good',
    this.image = '',
    this.contact,
  });
}
