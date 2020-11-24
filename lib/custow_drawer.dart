import 'package:flutter/material.dart';
import 'package:work_time_meter_flutter/globals.dart' as globals;
import 'package:work_time_meter_flutter/screens/login.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;
  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double szerokosc = mediaQuery.size.width;
    print(szerokosc);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey.withAlpha(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.access_alarm,size: 100.0,),
                // Image.asset(
                //   //todo dodac jakies fajne zdjecie
                //   "assets/filemon.jpg",
                //   // "assets/virago.jpg",
                //   width: 100,
                //   height: 100,
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Work Time Meter \nSide Navigation Bar",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 10.0,),
                // Text('${globals.loggedInUser.email}.', style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
          // Visibility(
          //   visible: false, //todo tak mozna ukrywac odpowiednie tresci
          //   child: Column(
          //     children: [
          //       ListTile(
          //         onTap: () {
          //           // if(_auth.currentUser() != null){
          //           //todo tu przekierowanie jesli uzytkownik nie ma odpowiednich uprawnien --> visibility wyglada działać lepiej :d
          //           Navigator.pushNamed(context, CounterScreen.id);
          //           // };
          //           // debugPrint("Go to first screen");
          //         },
          //         leading: Icon(Icons.account_balance, color: Colors.black),
          //         title: Text(
          //           "Go to first screen",
          //           style: TextStyle(color: Colors.black),
          //         ),
          //       ),
          //       Divider(
          //         height: 1,
          //         color: Colors.grey,
          //       ),
          //     ],
          //   ),
          // ),
          // Visibility(
          //   visible: false,
          //   child: Column(
          //     children: [
          //       ListTile(
          //         onTap: () {
          //           Navigator.pushNamed(context, CounterScreen.id);
          //           debugPrint("Tapped settings");
          //         },
          //         leading: Icon(Icons.access_alarm, color: Colors.black),
          //         title: Text(
          //           "Counter Screen",
          //           style: TextStyle(color: Colors.black),
          //         ),
          //       ),
          //       Divider(
          //         height: 1,
          //         color: Colors.grey,
          //       ),
          //     ],
          //   ),
          // ),
          Visibility(
            visible: false,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    bool userActivated1 = true;
                    //TODO tu mechanizm zakazu dostępu
                    if (userActivated1) {
                      // Navigator.pushNamed(context, ReportsScreenBegin.id);
                      debugPrint("Tapped Reports");
                    }
                  },
                  leading: Icon(Icons.border_color, color: Colors.black),
                  title: Text(
                    "Reports",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Visibility(
            visible: false,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    debugPrint("Tapped User screen");
                    // Navigator.pushNamed(context, UserScreenBegin.id);
                  },
                  leading: Icon(Icons.people, color: Colors.black),
                  title: Text(
                    "Users",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Visibility(
            visible: false,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    debugPrint("Tapped Notifications");
                    // Navigator.pushNamed(context, NotificationPage.id);
                  },
                  leading: Icon(Icons.notifications, color: Colors.black),
                  title: Text(
                    "Notifications",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Visibility(
            visible: true,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    debugPrint("Tapped sweb view");
                    // Navigator.pushNamed(context, WebView.id);

                  },
                  leading: Icon(Icons.drive_file_move, color: Colors.black),
                  title: Text(
                    "View Hours",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Visibility(
            visible: true,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    debugPrint("Tapped settings");
                  },
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          Visibility(
            visible: true,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    // _auth.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen() ),);
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

