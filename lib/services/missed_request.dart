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

class MissedRequest {
  String callResponse = '';
  bool accepted = false;
  Future makeCheckIn({
    required String name,
    required int age,
    required String location,
    required String date,
    required String physicalStatus,
    required String mentalStatus,
    required String image,
    required String contactName,
    required String contactphone,
    required String contactRealation,
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
        "name": contactName,
        "phone": contactphone,
        "relationship": contactRealation
      },
    };
    try {
      await dio
          .post("https://gednie.herokuapp.com/missed", data: jsonData)
          .then(
        (value) {
          accepted = true;
          print(
              '55555555555555555555555555555555555555555555555555555555555555555555');
        },
      );
    } on DioError catch (e) {
      accepted = false;
      print(e);
      print(e.error);
      print(e.response);
      callResponse = e.error;
    }
  }

  String getResponce() {
    return callResponse;
  }

  bool getAccepted() {
    return accepted;
  }
}
