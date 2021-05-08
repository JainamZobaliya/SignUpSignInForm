import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rorida_task/optionPage.dart';
import 'package:rorida_task/splashScreen.dart';
import 'package:rorida_task/userProfile.dart';
import 'package:rorida_task/welcomePage.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/ProfilePage';
  UserProfile user;
  ProfilePage({this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserProfile me;
  bool loaded = false;
  Future<void> loader() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      me = widget.user;
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) loader();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF7b113a),
      ),
      body: SingleChildScrollView(
          child: Container(
          color: Color(0xFF86EBFC),
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: me == null
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                      Color(0xFF7b113a),
                    )),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(50.0),
                        border: Border.all(color: Color(0xFF7b113a), width: 12.0),
                      ),
                      child: Text(
                        "\t\t\t" + me.userType + "\t\t\t",
                        style: TextStyle(
                            color: Color(0xFF7b113a),
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Name:",
                          style:
                              TextStyle(color: Color(0xFF7b113a), fontSize: 18),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Text(
                            "${me.fullName}",
                            style: TextStyle(
                              color: Color(0xFF7b113a),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Email Id.:",
                          style:
                              TextStyle(color: Color(0xFF7b113a), fontSize: 18),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Text(
                            "${me.emailId}",
                            style: TextStyle(
                              color: Color(0xFF7b113a),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Mobile No.:",
                          style:
                              TextStyle(color: Color(0xFF7b113a), fontSize: 18),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Text(
                            "${me.mobileNo}",
                            style: TextStyle(
                              color: Color(0xFF7b113a),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Age:",
                          style:
                              TextStyle(color: Color(0xFF7b113a), fontSize: 18),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Text(
                            "${me.age}",
                            style: TextStyle(
                              color: Color(0xFF7b113a),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Gender:",
                          style:
                              TextStyle(color: Color(0xFF7b113a), fontSize: 18),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Text(
                            "${me.gender}",
                            style: TextStyle(
                              color: Color(0xFF7b113a),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Id.:",
                          style:
                              TextStyle(color: Color(0xFF7b113a), fontSize: 18),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Text(
                            "${me.id}",
                            style: TextStyle(
                              color: Color(0xFF7b113a),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 50,),
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                child: MaterialButton(
                  elevation: 15.0,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                  shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(100.0)),
                  textColor: Color(0xFF123c69),
                  color: Color(0xFF7b113a),
                  splashColor: Color(0xFF64DFDF),
                  child: Row(
                    children: [
                      Icon(Icons.logout,color: Color(0xFF86EBFC), size: 28,),
                      SizedBox(width: 10,),
                      Text(
                        "Sign Out",
                        style: TextStyle( color: Color(0xFF86EBFC),fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    Navigator.popUntil(context, ModalRoute.withName(SplashPage.routeName));
                    await me.auth.signOut();
                    Navigator.of(context).pushNamed(WelcomePage.routeName,);
                  },
                ),
              ),
                  ],
                ),
        ),
      ),
    );
  }
}
