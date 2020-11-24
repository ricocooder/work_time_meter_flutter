import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:work_time_meter_flutter/custow_drawer.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
            ), Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  'Time you want to work:',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ), Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  'Time you should go home:',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ), Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  'Total time spend at work:',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ), Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  'Start Pracy:',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ), Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  'Stop Pracy:',
//          maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: fontsize
                  ),
                ),
              ),
            ),

            Text(
              'Counter Screen',
              style: TextStyle(
                fontSize: 55.0,
                color: Color(0xff757575),
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 48.0,
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
                        onPressed: () {
                          // Navigator.pushNamed(context, LoginScreen.id);
                          //Go to login screen.
                        },
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
                          //test tymczasowo wyłączone
                          // Navigator.pushNamed(context, ActivationProgress.id);
                          // Navigator.pushNamed(context, RegistrationScreen.id);
                          //Go to registration screen.ActivationProgress
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
