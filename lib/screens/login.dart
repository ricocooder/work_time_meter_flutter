import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:work_time_meter_flutter/constants.dart';
import 'package:work_time_meter_flutter/globals.dart' as globals;
import 'package:work_time_meter_flutter/screens/welcome.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget _emailTextField() {
    return TextFormField(
      // obscureText: true,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      style: TextStyle( color: Colors.red),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is empty';
        }
        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email adress';
        }return null;
      },
      onSaved: (value) {
        _email = value;
        //Do something with the user input.
      },
      decoration: kTextFieldDecoration.copyWith(labelText: 'Enter your email'),
    );
  }

  Widget _passwordTextField() {
    Firebase.initializeApp();
    return TextFormField(
      obscureText: true,
      textAlign: TextAlign.center,
      style: TextStyle( color: Colors.red),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        // if (value.length >= 6) {
        //   return 'Password should contain 6 characters';
        // }
        // if(!RegExp(r'(?=.*[A-Z])').hasMatch(value)){
        //   return 'Password should contain at least\none uppercase letter';
        // }
        // if(!RegExp(r'(?=.*[a-z])').hasMatch(value)){
        //   return 'Password should contain at least\none lower letter';
        // }
        // if(!RegExp(r'(?=.*[0-9])').hasMatch(value)){
        //   return 'Password should contain at least\none number';
        // }
        // if(!RegExp(r'(?=.*?[!@#\$%^&*~])').hasMatch(value)){
        //   return 'Password should contain at least\none special character';
        // }
        return null;
      },
      onSaved: (value) {
        _password = value;
        //Do something with the user input.
      },
      decoration:
      kTextFieldDecoration.copyWith(labelText: 'Enter your password', /*hintText: 'one upper case, one lower case, one digit, one special character'*/),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      SizedBox(
                        height: 14.0,
                      ),
                      _emailTextField(),
                      SizedBox(
                        height: 14.0,
                      ),
                      _passwordTextField(),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Text('Register Screen ?', style: TextStyle( color: Colors.white),),
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                        title: 'Login',
                        color: Colors.blueAccent,
                        onTab: () async {
                          print('Email: $_email');
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          // Scaffold.of(context).showSnackBar(SnackBar(content: Text('sdfsdfdsfsdfs'), action: SnackBarAction(label: 'UNDO', onPressed: Scaffold.of(context).hideCurrentSnackBar,),));
                          setState(() {
                            // showSpinner = true;
                          });
                          // print(_email);
                          // print(_password);
                          try {
                            final newUser =
                            (await _auth.signInWithEmailAndPassword(
                                email: _email, password: _password)
                            );
                            await newUser.user.sendEmailVerification();
                            // newUser.sendEmailVerification();
                            if (_auth.currentUser != null) {
                              // final user =  _auth.currentUser;
                              // final uid = user.uid.toString();
                              // print('poprawna rejestracja');
                              // await globals.firestore
                              //     .collection('Users')
                              //     .doc('$uid')
                              //     .set(
                              //     {
                              //       'UserName': '',
                              //       'UserSecondName': '',
                              //       'UserEmail': _email,
                              //       'Factory': '',
                              //       'Superior': '',
                              //       'Area': '',
                              //       'Position': '',
                              //       'AccontActivated': false,
                              //       'UserRegistrationTime': globals.timeFormatyyyy_MM_dd_HH_mm_ss.format(DateTime.now()).toString(),
                              //       'Status': null
                              //
                              //     });
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomeScreen() ),);
                              setState(() {
                                // showSpinner = false;
                              });
                            }
                          } catch (e) {
                            print(e);
                            setState(() {
                              // showSpinner = false;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 100.0,)
                    ],
                  ),
                ),
              ),
            ),

        ),
      ),
    );
  }
}
class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.onTab, @required this.title, @required this.color});

  final Function onTab;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTab,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
