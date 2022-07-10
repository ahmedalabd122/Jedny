import 'package:image_picker/image_picker.dart';
import 'package:jedny/models/contactModel.dart';

class FoundPerson {
  FoundPerson({
    this.name = 'ahmed',
    this.age = 23,
    this.location = 'Tanta',
    this.date = '',
    this.physicalState = 'good',
    this.mentalState = 'good',
    required this.image,
    this.contact,
  });
  final String name;
  final int age;
  final String location;
  String date;
  final String physicalState;
  final String mentalState;
  final XFile image;
  Contact? contact;
}
