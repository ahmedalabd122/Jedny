//import 'package:cloud_firestore/cloud_firestore.dart';

class MatchedModel implements Comparable<MatchedModel> {
  final String API;
  final String Description;
  final String Auth;
  final bool HTTPS;
  final String Cors;
  final String Link;
  final String Category;
  const MatchedModel({
    this.API = '',
    this.Description = '',
    this.Auth = '',
    this.HTTPS = true,
    this.Cors = '',
    this.Link = '',
    this.Category = '',
  });
  
  @override
  int compareTo(MatchedModel other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }

  // factory MatchedModel.fromFirestore(
  //   DocumentSnapshot<Map<String, dynamic>> snapshot,
  //   SnapshotOptions? options,
  // ) {
  //   final data = snapshot.data();
  //   return MatchedModel(
  //     API: data?['API'],
  //     Description: data?['Description'],
  //     Auth: data?['Auth'],
  //     HTTPS: data?['HTTPS'],
  //     Cors: data?['Cors'],
  //     Link: data?['Link'],
  //     Category: data?['Category'],
  //   );
  // }

  // Map<String, dynamic> toFirestore() {
  //   return {
  //     if (API != null) "name": API,
  //     if (Description != null) "state": Description,
  //     if (Auth != null) "country": Auth,
  //     if (HTTPS != null) "capital": HTTPS,
  //     if (Cors != null) "population": Cors,
  //     if (Link != null) "regions": Link,
  //     if (Category != null) "regions": Category,
  //   };
  // }

  // @override
  // int compareTo(MatchedModel other) {
  //   // TODO: implement compareTo
  //   throw UnimplementedError();
  // }

  // static MatchedModel? fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> snapshot) {}
}
