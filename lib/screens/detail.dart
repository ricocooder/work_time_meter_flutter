import 'dart:io';
import 'package:work_time_meter_flutter/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:work_time_meter_flutter/customCard_TwoLine.dart';
import 'package:work_time_meter_flutter/screens/view_hours.dart';

File imageFile;
var statustempnumber = 0;
String statustemporarytext;

class DetailPage extends StatefulWidget {
  static String id = 'detailscreen';
  DetailPage({@required this.passedId});
  final String passedId;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  eventHistoryStreamBuilder<QuerySnapshot>(snapshot) {
    final messages = snapshot.data.documents.reversed;
    List<MessageBubble> messageBubbles = [];
    for (var message in messages) {
      final start_pracy = message.data()['start_pracy'];
      final employer = message.data()['employer'];
      final main_note = message.data()['main_note'];
      final detail_note = message.data()['detail_note'];
      final eventid = message.id;
      final over_hours = message.data()['over_hours'];
      final stop_pracy = message.data()['stop_pracy'];
      final time_you_want_work_hour = message.data()['time_you_want_work_hour'];
      final time_you_want_work_min = message.data()['time_you_want_work_min'];

      final messageBubble = MessageBubble(
        start_pracy_from: start_pracy,
        detail_note_from: detail_note,
        event_from: eventid,
        over_hours_from: over_hours,
        time_you_want_work_hour_from: time_you_want_work_hour,
        main_note_from: main_note,
        employer_from: employer,
        stop_pracy_from: stop_pracy,
        time_you_want_work_min_from: time_you_want_work_min,
      );
      messageBubbles.add(messageBubble);
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: Text('Loaging.....'),
      );
    } else {
      return Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
          children: messageBubbles,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      child: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('WorkTime')
              .doc('${globals.g_userId}')
              .collection('SavedHours')
              .doc(widget.passedId)
              .snapshots(),
          builder: (context, snapshot1) {
            if (snapshot1.connectionState == ConnectionState.waiting) {
              return SafeArea(
                child: Material(
                  child: Column(
                    children: [
                      AppBar(
                        title: Text('DetailPage'),
                      ),
                      Center(
                        child: Text(
                          'Loaging.....',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBar(
                          title: Text('DetailPage'),
                        ),
                        CustomCardTwoLine(
                          firstText: "Employer",
                          secondText: "${snapshot1.data["employer"]}",
                        ),
                        CustomCardTwoLine(
                          firstText: "Start",
                          secondText: "${snapshot1.data["start_pracy"]}",
                        ),
                        CustomCardTwoLine(
                          firstText: "Stop",
                          secondText: "${snapshot1.data["stop_pracy"]}",
                        ),
                        CustomCardTwoLine(
                          firstText: "Planed time",
                          secondText:
                          "${snapshot1.data["time_you_want_work_hour"] + ':' + snapshot1.data["time_you_want_work_min"]}",
                        ),
                        CustomCardTwoLine(
                          firstText: 'Over Hours',
                          secondText: "${snapshot1.data["over_hours"]}",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: 100,
                            child: FlatButton(
                              color: Colors.lightBlueAccent,
                              padding: EdgeInsets.all(1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calculate,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Calculate',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop();
                                //done zapis do bazy danych
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: FlatButton(
                              color: Colors.lightBlueAccent,
                              padding: EdgeInsets.all(1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.save,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    'Save',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                              onPressed: () {
                                // deleteEvent(eventIdFrom1);
                                // Navigator.of(context, rootNavigator: true).pop();

                                //done zapis do bazy danych
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: FlatButton(
                              color: Colors.lightBlueAccent,
                              padding: EdgeInsets.all(1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                              onPressed: () {
                                // deleteEvent(eventIdFrom1);
                                // Navigator.of(context, rootNavigator: true).pop();

                                //done zapis do bazy danych
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              );
            }
          },
        ),
      ),
    );
  }

  createDeleteEventDialogReOpenEvent(BuildContext context) {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Re-open Event'),
          content: Text('Are you sure you want to Re-open this event ?'),
          actions: [
            Row(
              children: [
                FlatButton(
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.close,
                        color: Colors.yellow,
                      ),
                      Text(
                        'NO',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    //done zapis do bazy danych
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.restore_page_outlined,
                          color: Colors.red,
                        ),
                        Text(
                          'YES',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    onPressed: () {
                      // reOpenEvent();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewHours()),
                      );
                      //done zapis do bazy danych
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
