import 'package:flutter/material.dart';
import 'package:rorida_task/signIn.dart';
import 'package:rorida_task/signUp.dart';

class OptionPage extends StatelessWidget {
  static const routeName = '/OptionPage';
  String option;
  @override
  Widget build(BuildContext context) {
    option = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$option",
            style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xFF7b113a),
      ),
          body: Container(
        color: Color(0xFF86EBFC),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              child: MaterialButton(
                  elevation: 15.0,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(100.0)),
                  textColor: Color(0xFF7b113a),
                  color: Color(0xFF14D0FF),
                  splashColor: Colors.tealAccent,
                  child: Row(
                    children: [
                      Icon(Icons.app_registration, size: 35),
                      SizedBox(width: 10,),
                      Text(
                        "Sign Up",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.routeName,
                        arguments: option);
                  }),
            ),
            SizedBox(
              height: 100
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              child: MaterialButton(
                  elevation: 15.0,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(100.0)),
                  textColor: Color(0xFF7b113a),
                  color: Color(0xFF14D0FF),
                  splashColor: Colors.tealAccent,
                  child: Row(
                    children: [
                      Icon(Icons.login_rounded, size: 35),
                      SizedBox(width: 10,),
                      Text(
                        "Sign In",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignInPage.routeName,
                        arguments: option);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
