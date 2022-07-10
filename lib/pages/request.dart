import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jedny/models/contactModel.dart';
import 'package:jedny/models/foundPersonModel.dart';
import '../models/missedPersonModel.dart';
import '../models/contactModel.dart';

class Request {
  Request({required this.missed});
  bool missed = true;
  bool accepted = false;
  dynamic errorResponse;
  Future makeCheckIn({
    required dynamic person,
  }) async {
    final Dio dio = Dio();
    late Map<String, dynamic> jsonData;
    if (missed) {
      jsonData = {
        "name": person.name,
        "age": person.age,
        "location": person.location,
        "date": person.date,
        "physicalStatus": person.physicalStatus,
        "mentalStatus": person.mentalStatus,
        "photo": person.image,
        "contactInfo": {
          "name": person.contact.name,
          "phone": person.contact.phone,
          "relationship": person.contact.relationship
        }
      };
    } else {
      jsonData = {
        "name": person.name,
        "age": person.age,
        "location": person.location,
        "date": person.date,
        "physicalStatus": person.physicalStatus,
        "mentalStatus": person.mentalStatus,
        "photo": person.image,
        "contactInfo": {
          "name": person.contact.name,
          "phone": person.contact.phone,
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