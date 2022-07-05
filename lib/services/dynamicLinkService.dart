// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:jedny/models/matchedModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:jedny/pages/matched.dart';

// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// class DynamicLinkService {
//   static Future<String> createDynamicLink(
//       bool short, MatchedModel? matchedModel) async {
//     String _linkMessage;
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://jedny.page.link',
//       link: Uri.parse(
//           'https://api.publicapis.org/entries#/matchedModel?API=${matchedModel?.API}'),
//       androidParameters: AndroidParameters(
//         packageName: 'com.example.jedny',
//         minimumVersion: 125,
//       ),
//     );

//     Uri url;
//     if (short) {
//       final ShortDynamicLink shortLink = await parameters.buildShortLink();
//       url = shortLink.shortUrl;
//     } else {
//       url = await parameters.buildUrl();
//       print(url);
//     }

//     _linkMessage = url.toString();
//     print(_linkMessage);
//     return _linkMessage;
//   }

//   static Future<void> initDynamicLink(BuildContext context) async {
//     FirebaseDynamicLinks.instance.onLink(
//         onSuccess: (PendingDynamicLinkData? dynamicLink) async {
//       final Uri? deepLink = dynamicLink?.link;
//       print(dynamicLink);
//       bool? isMatched = deepLink?.pathSegments.contains('matchedModel');
//       if (isMatched == true) {
//         String? API = deepLink?.queryParameters['API'];

//         final ref =
//             firebaseFirestore.collection("API").doc("API").withConverter(
//                   fromFirestore: MatchedModel.fromFirestore,
//                   toFirestore: (MatchedModel matchedModel, _) =>
//                       matchedModel.toFirestore(),
//                 );
//         final docSnap = await ref.get();
//         final matchedModel = docSnap.data();
//         return Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => MatchedData(
//                       matchedModel: MatchedModel(),
//                     )));
//       }
//     }, onError: (OnLinkErrorException e) async {
//       print('link error');
//     });
//     final PendingDynamicLinkData? data =
//         await FirebaseDynamicLinks.instance.getInitialLink();
//     try {
//       final Uri? deepLink = data?.link;
//       var isMatched = deepLink?.pathSegments.contains('MatchedModel');
//       if (isMatched == true) {
//         // TODO :Modify Accordingly
//         String? id =
//             deepLink?.queryParameters['API']; // TODO :Modify Accordingly

//         // TODO : Navigate to your pages accordingly here

//         try {
//           await firebaseFirestore
//               .collection('Stories')
//               .doc(id)
//               .get()
//               .then((snapshot) {
//             MatchedModel? matchedModel = MatchedModel.fromSnapshot(snapshot);

//             return Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MatchedData(
//                           matchedModel: matchedModel,
//                         )));
//           });
//         } catch (e) {
//           print(e);
//         }
//       }
//     } catch (e) {
//       print('No deepLink found');
//     }
//   }
// }
