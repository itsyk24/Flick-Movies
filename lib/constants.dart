import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
 String ftdTotal='0';
String ftdWebseries='0';
String ftdAnime='0';
String ftdThisMonth='';
String ftdThisYr='';
String currentYr = '';
String currentMonth = '';
String chinkuNotiCount = '';
String snowNotiCount = '';


const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
 List yearList =[];
int currentYear = DateTime.now().year;
int startingYear = 2019;
var currMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
String currentMovie='';
String currentMovieRlsYr='';
String currentMovieWtchYr='';
String currentMovieWtchMonth='';
List currentMovieGenre =[];
String currentMovieLan='';
bool notificato = false;
String currentMovieChinkuRt='';
String currentMovieSnowRt='';
String filterYear = '2022';
String chinkuId = '8t8iOIeGeUaRWDjFqzN6PoqM4Cp1';
String snowId='lm84e51AryXitb8MU5spH3eXlB03';
String currentUserId ='';
const kPrimaryColor = Color(0xFF6F35A5);

const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;

late QuerySnapshot snapData;


class Constants {
  //Primary color
  static var primaryColor = const Color(0xff296e48);
  static var blackColor = Colors.black54;

  //Onboarding texts
  static var titleOne = "Learn more about plants";
  static var descriptionOne = "Read how to care for plants in our rich plants guide.";
  static var titleTwo = "Find a plant lover friend";
  static var descriptionTwo = "Are you a plant lover? Connect with other plant lovers.";
  static var titleThree = "Plant a tree, green the Earth";
  static var descriptionThree = "Find almost all types of plants that you like here.";
}
