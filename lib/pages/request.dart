import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Request {
  Future makeCheckIn({
    required String name,
    required String age,
    required String location,
    required String physicalStatus,
    required String mentalStatus,
    required XFile image,
  }) async {
    final Dio dio = Dio();
    late Map<String, dynamic> jsonData;
    late Map<String, dynamic> jsonPhoto;
    late Map<String, dynamic> jsonReq;
    late Map<String, dynamic> jsonfiles;
    print("from dio the path is here ${image.path}");
    if (image != null) {
      var fileImage = await MultipartFile.fromFile(image.path,
          filename: image.path.split("/").last.toString());
      jsonData = {
        "name": name,
        "age": age,
        "location": location,
        "physicalStatus": physicalStatus,
        "mentalStatus": mentalStatus,
        "photo": fileImage
      };
    }
    FormData formData = FormData.fromMap(jsonData);
    //dio.options.headers["Authorization"] = "Bearer ";
    await dio
        .post("https://jedni.herokuapp.com/found/", data: formData)
        .then((value) {
      print("value  $value");
    }).onError((error, stackTrace) {
      print("error is $error");
    });
  }
}

class Contact {
  Contact(
      {required this.contactName,
      required this.contactNumber,
      required this.relationWithMissed});
  String contactName, relationWithMissed, contactNumber;
}
