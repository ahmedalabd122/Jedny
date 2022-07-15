import 'package:flutter/material.dart';
import 'package:jedny/models/matchedModel.dart';
import 'package:jedny/services/dynamicLinkService.dart';
import 'package:jedny/services/firebase_dynamic_link.dart';

class MatchedData extends StatefulWidget {
  MatchedData({Key? key, required this.matchedModel}) : super(key: key);
  MatchedModel? matchedModel;
  @override
  State<MatchedData> createState() => _MatchedDataState();
}

class _MatchedDataState extends State<MatchedData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //DynamicLinkService.createDynamicLink(false, widget.matchedModel);
    //DynamicLinkService.initDynamicLink(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
