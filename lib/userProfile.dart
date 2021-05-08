import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserProfile {
  String userId;
  String id;
  String fullName;
  String emailId;
  String mobileNo;
  String gender;
  int age;
  bool status;
  FirebaseAuth auth;
  String userType;

  void setLogInStatus(bool status) {
    this.status = status;
  }

  UserProfile({String userId}) {
    this.userId = userId;
    getFormData(userId);
  }

  void setId(String data) {
    this.id = data;
  }

  void setEmailId(String data) {
    this.emailId = data;
  }

  void setFullName(String data) {
    this.fullName = data;
  }

  void setMobileNo(String data) {
    this.mobileNo = data;
  }

  void setAge(int data) {
    this.age = data;
  }

  void setGender(String data) {
    this.gender = data;
  }

  void setUserType(String data) {
    this.userType = data;
  }

  Future<void> getFormData(String userId) async {
    final uid = userId;
    final dbRef = FirebaseDatabase.instance.reference();
    await dbRef.once().then((DataSnapshot snapshot) async {
      snapshot.value.forEach((key, val) => val.forEach((key, val) {
            if (key == uid) {
              setUserType(val['userType']);
              if(userType=="Doctor")
                setId(val['doctorId']);
              else
                setId(val['patientId']);
              setEmailId(val['emailId']);
              setFullName(val['fullName']);
              setMobileNo(val['mobileNo']);
              setAge(val['age']);
              setGender(val['gender']);
              print('Email Id.: ${this.emailId}');
              print('Full Name: ${this.fullName}');
              print('Mobile No.: ${this.mobileNo}');
              print('Age: ${this.age}');
              print('Gender: ${this.gender}');
              print('UserType: ${this.userType}');
            }
          }));
    });
  }

}