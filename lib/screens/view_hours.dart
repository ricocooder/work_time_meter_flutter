import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text('tu bedziemy wyswietlac godziny pracy '),
            ],
          ),
        ),
      ),
    );
  }
}
