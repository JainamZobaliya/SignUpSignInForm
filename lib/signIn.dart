import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rorida_task/optionPage.dart';
import 'package:rorida_task/profilePage.dart';
import 'package:rorida_task/signUp.dart';
import 'package:rorida_task/userProfile.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/SignInPage';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailId = TextEditingController();
  bool _passwordVisible = false;
  final TextEditingController _password = TextEditingController();
  String option;
  @override
  Widget build(BuildContext context) {
    option = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(OptionPage.routeName));
             },
            child: Icon(
              Icons.arrow_back_rounded,  // add custom icons also
            ),
        ),
          title: Text(
            'Sign In',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFF7b113a),
        ),
        body: Container(
        color: Color(0xFF86EBFC),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Form(
                key: _key,
                child: logInForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logInForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(50.0),
                border: Border.all(color: Color(0xFF7b113a), width: 12.0),
              ),
              child: Text("\t\t\t"+option+"\t\t\t", style: TextStyle(color: Color(0xFF7b113a), fontWeight: FontWeight.bold, fontSize: 32),),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
                style: TextStyle(
                  color: Color(0xFF123c69),
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
                controller: _emailId,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, 0.5),
                  labelText: 'Email Id.',
                  labelStyle: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF123c69),
                  ),
                  focusColor: Color(0xFF123c69),
                  prefixIcon: Icon(Icons.person, color: Color(0xFF123c69)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF123c69)),
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String value) {
                  EmailValidator.validate(value)
                      ? null
                      : "Invalid Email Address";
                  return null;
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              style: TextStyle(
                color: Color(0xFF123c69),
                fontFamily: 'Times New Roman',
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 0.5),
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF123c69),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Color(0xFF123c69),
                ),
                suffixIcon: IconButton(
                  tooltip:
                      _passwordVisible ? "Hide Password" : " Show Password",
                  color: Color(0xFF123c69),
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF123c69),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF123c69),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
                border: OutlineInputBorder(),
              ),
              controller: _password,
              obscureText: !_passwordVisible,
              keyboardType: TextInputType.text,
              validator: (String value) {
                Pattern pattern =
                    r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                RegExp regex = new RegExp(pattern);
                if (!regex.hasMatch(value)) {
                  return "Invalid Passsword";
                } else
                  return null;
              },
            ),
          ),
          MaterialButton(
            elevation: 15.0,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100.0)),
              textColor: Color(0xFF123c69),
              color: Color(0xFF7b113a),
              splashColor: Color(0xFF64DFDF),
            child: Text(
              "Sign In",
              style: TextStyle( color: Color(0xFF86EBFC), fontWeight: FontWeight.bold, fontSize: 25),
            ),
            onPressed: () async {
              Center(
                child: CircularProgressIndicator(),
              );
              if (_key.currentState.validate()) {
                _signInWithEmailAndPassword();
              }
               else {
                showMessageSnackBar("Please fill the valid Details!!");
              }
            },
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            elevation: 0.0,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100.0)),
            textColor: Color(0xFF123c69),
            color: Color(0xFF86EBFC),
            splashColor: Color(0xFF7b113a),
            child: Text(
              "New User?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
            ),
            onPressed: () async {
              Center(
                child: CircularProgressIndicator(),
              );
              await Navigator.pushNamed(context, SignUpPage.routeName, arguments: option);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailId.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<bool> checkUserDomain()
  async {
    final dbRef = FirebaseDatabase.instance.reference();
    await dbRef.once().then((DataSnapshot snapshot) async {
      await snapshot.value.forEach((key, val){
        if(key==option+"s")
        {
          val.forEach((key,val) async => await val.forEach((key,val)
          {
            if(key=="emailId")
            {
              String mail = _emailId.text;
              if(val==mail)
              {
                setState(() {
                  this.signUp = true;
                  print(signUp);
                });
              }
            }
          }));
        }
      });});
      if(!signUp)
        setState(() {
          this.signUp = false;
        });
      return false;
  }
  bool signUp = false;

  void _signInWithEmailAndPassword() async {
    try {
      await checkUserDomain();
      print("signUp: ${this.signUp}");
      if(this.signUp)
      {
        final User user = (await _auth.signInWithEmailAndPassword(
          email: _emailId.text,
          password: _password.text,
        )).user;
        final user1 = _auth.currentUser;
        var userId = user1.uid;
        UserProfile me = new UserProfile(userId: userId);
        if (!user.emailVerified) {
          showMessageSnackBar("Please Verify your Email.");
          await user.sendEmailVerification();
        } else {
          onLoading(context, me);
        }
      }
      else
      {
        showMessageSnackBar("Not Sign Up in $option Portal!!");
      }
    } catch (err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message+"\n\nPlease, Try again!!", textAlign: TextAlign.center),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  void showMessageSnackBar(String message) {
    final snackBar = new SnackBar(
      content: new Text("$message"),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void onLoading(BuildContext context, UserProfile me) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xFF7b113a)),
                ),
                new Text(
                  "Loading",
                  style: TextStyle(
                      color: Color(0xFF7b113a),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
          ),
        );
      },
    );
    new Future.delayed(
        new Duration(seconds: 3),
        () => {
              Navigator.pop(context), //pop dialog
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                me.auth = FirebaseAuth.instance;
                return ProfilePage(
                  user: me,
                );
              }))
            });
  }
}