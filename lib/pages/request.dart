import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jedny/models/contactModel.dart';
import '../models/missedPersonModel.dart';
import '../models/contactModel.dart';

class Request {
  Request();
  Future makeCheckIn({
    required String name,
    required String age,
    required String location,
    required String date,
    required String physicalStatus,
    required String mentalStatus,
    required String image,
    required Contact contact,
  }) async {
    final Dio dio = Dio();
    late Map<String, dynamic> jsonData;
    late Map<String, dynamic> jsonPhoto;
    late Map<String, dynamic> jsonReq;
    late Map<String, dynamic> jsonfiles;
    //print("from dio the path is here ${image.path}");
    jsonData = {
      "name": name,
      "age": age,
      "location": location,
      "date": date,
      "physicalStatus": physicalStatus,
      "mentalStatus": mentalStatus,
      "photo": image,
      "contactInfo": {
        "name": contact.name,
        "phone": contact.phone,
        "relationship": contact.relationship
      },
    };
    FormData formData = FormData.fromMap(jsonData);
    print(formData.fields);
    try {
      await dio
          .post("https://gednie.herokuapp.com/missed", data: formData)
          .then(
        (value) {
          print(
              '55555555555555555555555555555555555555555555555555555555555555555555');
          // print(value.data);
          // print("value  $value");
        },
      );
    } on DioError catch (e) {
      print(e.error);
      print(e.response);
    }
  }
}
