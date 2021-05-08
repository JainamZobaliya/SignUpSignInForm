import 'package:flutter/material.dart';
import 'package:rorida_task/optionPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/WelcomePage';
  @override
  Widget build(BuildContext context) {
    var userList = ["Doctor", "Patient"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor-Patient App",
            style: TextStyle( color: Color(0xFF86EBFC),fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF7b113a),
      ),
          body: Container(
        color: Color(0xFF7b113a),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            for(int i=0; i<2;++i)
              Container(
                margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              child: MaterialButton(
                  elevation: 15.0,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(100.0)),
                  textColor: Color(0xFF7b113a),
                  color: Color(0xFF86EBFC),
                  splashColor: Colors.tealAccent,
                  child: Row(
                    children: [
                      userList[i]=="Doctor" ? Icon(Icons.local_hospital, size: 35):Icon(Icons.person, size: 35),
                      SizedBox(width: 10,),
                      Text(
                        "${userList[i]}",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, OptionPage.routeName,
                        arguments: "${userList[i]}");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
