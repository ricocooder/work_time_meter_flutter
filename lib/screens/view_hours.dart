import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_time_meter_flutter/auth_privider.dart';
import 'package:work_time_meter_flutter/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:work_time_meter_flutter/customCard_TwoLine.dart';
import 'package:work_time_meter_flutter/custow_drawer.dart';

class ViewHoursBegin extends StatefulWidget {
  @override
  _ViewHoursBeginState createState() => _ViewHoursBeginState();
}

class _ViewHoursBeginState extends State<ViewHoursBegin> {
  FSBStatus drawerStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      child: SafeArea(
        child: Scaffold(
          body: SwipeDetector(
            onSwipeRight: () {
              setState(
                    () {
                  drawerStatus = FSBStatus.FSB_OPEN;
                },
              );
            },
            onSwipeLeft: () {
              setState(
                    () {
                  drawerStatus = FSBStatus.FSB_CLOSE;
                },
              );
            },
            child: FoldableSidebarBuilder(
              drawerBackgroundColor: Colors.blueAccent,
              drawer: CustomDrawer(
                closeDrawer: () {
                  setState(
                        () {
                      drawerStatus = FSBStatus.FSB_CLOSE;
                    },
                  );
                },
              ),
              screenContents: ViewHours(),
              status: drawerStatus,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue[500],
            child: Icon(
              drawerStatus == FSBStatus.FSB_OPEN
                  ? Icons.arrow_back_ios
                  : Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onPressed: () {
              setState(
                    () {
                  drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                      ? FSBStatus.FSB_CLOSE
                      : FSBStatus.FSB_OPEN;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ViewHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userUID = AuthProvider.of(context).auth;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
          child: Column(
            children: [
              // Text('tu bedziemy wyswietlac godziny pracy '),
              EventsStream(),
            ],
          ),
        ),
      ),
    );
  }
}
class EventsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('WorkTime')
          .doc('xgvULzl896axpqCDMy09204x3rJ3')
          .collection('SavedHours')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final start_pracy = message.data()['start_pracy'];
          final employer = message.data()['employer'];
          final main_note = message.data()['main_note'];
          final detail_note = message.data()['detail_note'];
          // final order = message.data()['order'];
          final over_hours = message.data()['over_hours'];
          final stop_pracy = message.data()['stop_pracy'];
          final time_you_want_work_hour = message.data()['time_you_want_work_hour'];
          final time_you_want_work_min = message.data()['time_you_want_work_min'];

          final messageBubble = MessageBubble(
            start_pracy_from : start_pracy,
            employer_from: employer,
            main_note_from: main_note,
            detail_note_from: detail_note,
            // order_from: order,
            over_hours_from: over_hours,
            stop_pracy_from: stop_pracy,
            time_you_want_work_hour_from: time_you_want_work_hour,
            time_you_want_work_min_from: time_you_want_work_min,


          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            padding:
            EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
            children: messageBubbles,
          ),
        );
      },
    );
    }
  }
class MessageBubble extends StatelessWidget {
  MessageBubble({
    this.start_pracy_from,
    this.employer_from,
    this.main_note_from,
    // this.order_from,
    this.over_hours_from,
    this.stop_pracy_from,
    this.time_you_want_work_hour_from,
    this.time_you_want_work_min_from,
    this.detail_note_from

  });

  final int start_pracy_from;
  final String employer_from;
  final String main_note_from;
  // final String order_from;
  final String over_hours_from;
  final int stop_pracy_from;
  final String time_you_want_work_hour_from;
  final String time_you_want_work_min_from;
  final String detail_note_from;


  @override
  Widget build(BuildContext context) {
      return Card(
        //TODO tu zczytywac on tap ?
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        color: colorPicker(colornumber: over_hours_from),
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          // onTap: () {
            // print('Taped: $eventIdFrom');
//          Navigator.pushNamed(context, MaterialPageRoute(builder: (context)));
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => DetailPage(
//                       passedId: '$eventIdFrom',
//                     )));
//          navigateToDetailPage(eventIdFrom);
            //done open "DetailPage" passing eventIdFrom and display all detail
          // },
          // onLongPress: () {
          //   createDeleteEventDialog(context, eventIdFrom);
          // },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCardTwoLine(
                  firstText: 'Start', secondText: globals
                  .timeFormatyyyy_MM_dd_EEEE_HH_mm_ss
                  .format(DateTime.fromMillisecondsSinceEpoch(start_pracy_from))
                  .toString()),
              CustomCardTwoLine(
                  firstText: 'Stop', secondText: globals
                  .timeFormatyyyy_MM_dd_EEEE_HH_mm_ss
                  .format(DateTime.fromMillisecondsSinceEpoch(stop_pracy_from))
                  .toString()),
              CustomCardTwoLine(firstText: 'Planed Hours:', secondText: '$time_you_want_work_hour_from:$time_you_want_work_min_from'),
              CustomCardTwoLine(firstText: 'Total Hours:', secondText: '${DateTime.fromMillisecondsSinceEpoch(stop_pracy_from).difference(
                  DateTime.fromMillisecondsSinceEpoch(start_pracy_from)).inHours.remainder(60).toString().padLeft(2,'0')}:${DateTime.fromMillisecondsSinceEpoch(stop_pracy_from).difference(
                  DateTime.fromMillisecondsSinceEpoch(start_pracy_from)).inMinutes.remainder(60).toString().padLeft(2,'0')}:${DateTime.fromMillisecondsSinceEpoch(stop_pracy_from).difference(
                  DateTime.fromMillisecondsSinceEpoch(start_pracy_from)).inSeconds.remainder(60).toString().padLeft(2,'0')}'),

              CustomCardTwoLine(
                  firstText: 'Over Hours', secondText: over_hours_from),
              // CustomCardTwoLine(firstText: 'Status', secondText: statusFrom),
              // CustomCardTwoLine(
              //     firstText: 'Closed', secondText: closedTimeFrom),
              // CustomCardTwoLine(
              //     firstText: 'EventTimeInSec', secondText: eventTimeFrom),
            ],
          ),
        ),
      );

  }

  colorPicker({String colornumber}) {
    if (colornumber != null) {
      return Colors.red;
    }
    // if (colornumber == 'Proces') {
    //   return Colors.blue;
    // }
    // if (colornumber == 'Packing') {
    //   return Colors.yellow;
    // }
    // if (colornumber == 'Multipacking') {
    //   return Colors.lightGreen;
    // }
    // if (colornumber == 'Utility') {
    //   return Colors.brown;
    // }
    else {
      return Colors.lightGreen;
    }
  }
}