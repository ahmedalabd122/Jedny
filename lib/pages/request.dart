import 'dart:developer';

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
  String foundUrl = "https://gednie.herokuapp.com/found";
  String missedUrl = "https://gednie.herokuapp.com/missed";
  bool missed = true;
  bool accepted = false;
  dynamic errorResponse;
  Future makeCheckIn({
    required String name,
    required int age,
    required String location,
    required String date,
    required String physicalStatus,
    required String mentalStatus,
    required String image,
    required Contact contact,
  }) async {
    final Dio dio = Dio();
    late Map<String, dynamic> jsonData;
    if (missed) {
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
        }
      };
    } else {
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
        }
      };
    }

    if (missed) {
      try {
        await dio
            .post("https://gednie.herokuapp.com/missed", data: jsonData)
            .then(
          (value) {
            accepted = true;
            print(value.data);
            print("value  $value");
            getError();
            getRespose();
          },
        );
      } on DioError catch (e) {
        accepted = false;
        print(e.error);
        print(e.response);
        errorResponse = e.response!;
        getError();
        getRespose();
      }
    } else {
      try {
        await dio
            .post("https://gednie.herokuapp.com/found", data: jsonData)
            .then(
          (value) {
            accepted = true;
            print(value.data);
            print("value  $value");
            getError();
            getRespose();
          },
        );
      } on DioError catch (e) {
        accepted = false;
        print(e.error);
        print(e.response);
        errorResponse = e.response!;
        getError();
        getRespose();
      }
    }
  }

  bool getError() {
    return accepted;
  }

  String getRespose() {
    if (accepted == false) {
      return errorResponse.toString();
    } else {
      return errorResponse.toString();
    }
  }
}
    //print(formData.fields);

    // await dio
    //     .post("https://gednie.herokuapp.com/missed", data: jsonData)
    //     .then((value) {
    //   log(value.toString());
    // }).onError((error, stackTrace) {
    //   log(error.toString());
    // });