import 'package:drowsiness_detector/constants.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportTiles extends StatefulWidget {
  static const id = 'report_screen';
  @override
  _ReportTilesState createState() => _ReportTilesState();
}

class _ReportTilesState extends State<ReportTiles> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('Active Reports'),
          backgroundColor: Colors.deepOrange.shade400,
        ),
        body: ReportList(),
      ),
    );
  }
}

class ReportList extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('timestamps')
            .orderBy("time", descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.shade400,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Drowsiness Detected',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(document['time'], style: kButtonTextStyle),
                          SizedBox(width: 45),
                          Text(document['date'], style: kButtonTextStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    ]);
  }
}
