import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:work_time_meter_flutter/custow_drawer.dart';
import 'package:work_time_meter_flutter/globals.dart' as globals;
import 'package:work_time_meter_flutter/show_nessage.dart';

// String startPracyString = '';
// String stopPracyString = '';
double percent = 0.0;
bool counterstarted = false;
bool countingUp = false;
bool countingDown = false;
int startPracy;
int stopPracy;
Duration overHours;
Duration fidddd;
int timeYouWantWorkHour = 8;
int timeYouWantWorkMin = 25;
int timeYouShouldGoHome;
Duration totalTimeSpendAtWork;

class CounterScreenBegin extends StatefulWidget {
  @override
  _CounterScreenBeginState createState() => _CounterScreenBeginState();
}

class _CounterScreenBeginState extends State<CounterScreenBegin> {
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
              screenContents: CounterScreen(),
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

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // Timer timer;
@override
  void initState() {
  get_sgared_preferencess();

  // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  'Pracodawca:',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  'Time you want to work: $timeYouWantWorkHour:$timeYouWantWorkMin',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: timeYouShouldGoHome != null ? Text(
                  'Time you should go home: ${globals
                      .timeFormatyyyy_MM_dd_HH_mm_ss
                      .format(DateTime.fromMillisecondsSinceEpoch(timeYouShouldGoHome))
                      .toString()}',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ): Text(
                  'Time you should go home:',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: startPracy != null ? Text(
                  'Start Pracy: ${globals
                      .timeFormatyyyy_MM_dd_HH_mm_ss
                      .format(DateTime.fromMillisecondsSinceEpoch(startPracy))
                      .toString()}',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ): Text(
                  'Start Pracy:',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: stopPracy != null ? Text(
                  'Stop Pracy: ${globals
                      .timeFormatyyyy_MM_dd_HH_mm_ss
                      .format(DateTime.fromMillisecondsSinceEpoch(stopPracy))
                      .toString()}',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ): Text(
              'Stop Pracy:',
//          maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          // fontSize: fontsize
        ),
      ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: totalTimeSpendAtWork != null
                    ? Text(
                        'Total time spend at work: ${totalTimeSpendAtWork?.inHours?.remainder(60).toString().padLeft(2,'0')}:${totalTimeSpendAtWork?.inMinutes?.remainder(60).toString().padLeft(2,'0')}:${totalTimeSpendAtWork?.inSeconds?.remainder(60).toString().padLeft(2,'0')}',
                        style: TextStyle(
                          color: Colors.white,
                          // fontSize: fontsize
                        ),
                      )
                    : Text(
                        'Total time spend at work:',
                        style: TextStyle(
                          color: Colors.white,
                          // fontSize: fontsize
                        ),
                      ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: overHours != null ? Text(
                  'Over Hours: ${overHours.inHours.remainder(60).toString().padLeft(2,'0')}:${overHours.inMinutes.remainder(60).toString().padLeft(2,'0')}:${overHours.inSeconds.remainder(60).toString().padLeft(2,'0')}',
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ):Text(
                  'Over Hours: ',
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),

              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            //todo progres indicator
            // CircularPercentIndicator(
            //   radius: 200.0,
            //   backgroundColor: Colors.green,
            //   circularStrokeCap: CircularStrokeCap.round,
            //   percent: percent,
            //   lineWidth: 20.0,
            //   animation: true,
            //   animateFromLastPercent: true,
            //   progressColor: Colors.deepOrange,
            //   center: Text(
            //     '${fidddd?.inHours.toString().padLeft(2, "0")}:${fidddd?.inMinutes?.remainder(60).toString().padLeft(2, "0")}:${fidddd?.inSeconds?.remainder(60).toString().padLeft(2, "0")}\n${(percent * 100).toStringAsFixed(2)}%',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            // Text(
            //   'Counter Screen',
            //   style: TextStyle(
            //     fontSize: 55.0,
            //     color: Color(0xff757575),
            //     fontWeight: FontWeight.w900,
            //   ),
            // ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      // minWidth: 200.0,
                      // height: 42.0,
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.green,
                          ),
                          Text(
                            'Start',
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          // _startTimer();
                          // counterstarted = true;
                          // stopPracy = null;
                          // stopPracyString = '';
                          // totalTimeSpendAtWork = null;
                          startPracy = DateTime.now().millisecondsSinceEpoch;
                          timeYouShouldGoHome = startPracy +
                              (timeYouWantWorkHour * 60 * 60 * 1000) +
                              (timeYouWantWorkMin * 60 * 1000);
                          DateTime date = DateTime.fromMillisecondsSinceEpoch(
                              timeYouShouldGoHome);
                          // timeYouShouldGoHomeString = globals
                          //     .timeFormatyyyy_MM_dd_HH_mm_ss
                          //     .format(date)
                          //     .toString();
                          print('----------START BUTTON PRESSED----------');
                          // print('startPracyString: $startPracyString');
                          print('startPracyMilisSinceEpoch: $startPracy');
                          print('TimeYouShouldGoHome: $timeYouShouldGoHome');
                          // print(
                          //     'timeYouShouldGoHomeString: $timeYouShouldGoHomeString');
                        }

                        );
                        save_shared_preferences('timeYouShouldGoHome', timeYouShouldGoHome);
                        save_shared_preferences('startPracy', startPracy);
                        // Navigator.pushNamed(context, LoginScreen.id);
                        //Go to login screen.
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            // timer.cancel();
                            counterstarted = false;
                            // stopPracyString = globals
                            //     .timeFormatyyyy_MM_dd_HH_mm_ss
                            //     .format(DateTime.now())
                            //     .toString();
                            stopPracy = DateTime.now().millisecondsSinceEpoch;
                            totalTimeSpendAtWork = DateTime.now().difference(
                                DateTime.fromMillisecondsSinceEpoch(
                                    startPracy));

                            if(stopPracy > timeYouShouldGoHome){
                              overHours = DateTime.fromMillisecondsSinceEpoch(stopPracy).difference(DateTime.fromMillisecondsSinceEpoch(timeYouShouldGoHome));
                            }else{
                              overHours = null;
                            }

                            print('----------STOP BUTTON PRESSED----------');
                            // print(stopPracyString);
                            print('Over Hours: $overHours');
                            print('timeYouShouldGoHome: $timeYouShouldGoHome');
                            print(
                                'totalTimeSpendAtWork: $totalTimeSpendAtWork');
                            print('stopPracyMilisSinceEpoch: $stopPracy');
                          });
                          save_shared_preferences('stopPracy', stopPracy);

                        },
                        // minWidth: 200.0,
                        // height: 42.0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.stop,
                              color: Colors.red,
                            ),
                            Text(
                              'Stop',
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            upload();
                            // startPracyString = '';

                          });
                        },
                        // minWidth: 200.0,
                        // height: 42.0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.save,
                              color: Colors.blue,
                            ),
                            Text(
                              'Save',
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  get_sgared_preferencess()async{
    final prefs = await SharedPreferences.getInstance();
    startPracy = prefs.getInt('startPracy');
    stopPracy = prefs.getInt('stopPracy');
    timeYouShouldGoHome = prefs.getInt('timeYouShouldGoHome');

  }
  upload()async{
    //test
    final _auth = await FirebaseAuth.instance;
    final user =  await _auth.currentUser;
    final uid = await user.uid.toString();
    print('poprawna rejestracja');
    try{
    await globals.firestore
        .collection('WorkTime')
        .doc('$uid')
        .collection('SavedHours').doc('${globals
        .timeFormatyyyy_MM_dd_HH_mm_ss
        .format(DateTime.now())
        .toString()}')
        .set(
        {
          'detail_note': '',
          'employer': '',
          'main_note': '',
          'order': '',
          'over_hours': overHours != null ?
        '${overHours.inHours.remainder(60).toString().padLeft(2,'0')}:${overHours.inMinutes.remainder(60).toString().padLeft(2,'0')}:${overHours.inSeconds.remainder(60).toString().padLeft(2,'0')}':
        null,
          'time_you_want_work_hour': '$timeYouWantWorkHour',
          'time_you_want_work_min': '$timeYouWantWorkMin',
          'start_pracy': startPracy,
          'stop_pracy': stopPracy,
        });
    setState(() {

      overHours = null;
      startPracy = null;
      save_shared_preferences('startPracy', startPracy);
      stopPracy = null;
      save_shared_preferences('stopPracy', stopPracy);
      timeYouShouldGoHome = null;
      save_shared_preferences('timeYouShouldGoHome', timeYouShouldGoHome);
      totalTimeSpendAtWork = null;

    });
    //test
    }catch(e){
      showUserMessageByToast(
          displayedText: e,
          toastTimeDisplay: Toast.LENGTH_SHORT,
          messageGravity: ToastGravity.BOTTOM,
          textColor: Colors.red,
          backgroundColor: Colors.white,
          fontsize: 15);
      print(e);
    }
  }
  // _startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       //todo totaltimespednatwork
  //       var startpracysdfsf = DateTime.fromMillisecondsSinceEpoch(startPracy);
  //       fidddd = DateTime.now().difference(startpracysdfsf);
  //       var costam  = startPracy - DateTime.now().millisecondsSinceEpoch;
  //       var countDown = timeYouShouldGoHome - DateTime.now().millisecondsSinceEpoch;
  //       var costamsadadsad = ((100*countDown)/(timeYouWantWorkHour*60*60*1000 + timeYouWantWorkMin*60*1000));
  //       var perfsdfsdfdsfcent = (100-costamsadadsad);
  //       percent = (perfsdfsdfdsfcent).abs();
  //       // if (percent < 0.1) {
  //       //   countingUp = true;
  //       //   countingDown = false;
  //       // }
  //       // if (percent > 0.9) {
  //       //   countingUp = false;
  //       //   countingDown = true;
  //       // }
  //       // if (percent < 1.0 && countingUp) {
  //       //   percent = (percent + 0.01).toDouble();
  //       // }
  //       // if (percent > 0.0 && countingDown) {
  //       //   percent = (percent - 0.01).toDouble();
  //       // }
  //     });
  //     print(
  //         '\n\n\n\n\n\nCounter up: $countingUp\nCounterDown: $countingDown\nDiff: $fidddd\nTick, percent: $percent');
  //   });
  //   print('Timer Started');
  // }
}
save_shared_preferences(String key, value)async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
}
