import 'package:flutter/material.dart';
import 'package:work_time_meter_flutter/screens/counter.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    // var userfromprovider = Provider.of<FirebaseUser>(context);

    // if(userfromprovider != null){
    //   Navigator.pushNamed(context, UserScreenBegin.id);
    // }

      return
        Scaffold(
          backgroundColor: Colors.grey[900],
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Work \nand \nTime \nManager',
                  style: TextStyle(
                    fontSize: 55.0,
                    color: Color(0xff757575),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CounterScreenBegin() ),);

                        // Navigator.pushNamed(context, LoginScreen.id);
                        //Go to login screen.
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'CounterScreen',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        //test tymczasowo wyłączone
                        // Navigator.pushNamed(context, ActivationProgress.id);
                        // Navigator.pushNamed(context, RegistrationScreen.id);
                        //Go to registration screen.ActivationProgress
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'costam',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

  }
}
