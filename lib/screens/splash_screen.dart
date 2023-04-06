import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick2movies/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
String finalEmail='';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // video controller


  @override


  void _playVideo() async {

    await Future.delayed(const Duration(seconds: 4));
    if((finalEmail!=null)&&(finalEmail!='')){
      final currentYr =  DateTime.now().year.toString();
      final currentMonth =  currMonths[DateTime.now().month-1];
print(currentMonth);

      final FirebaseAuth auth = FirebaseAuth.instance;
      print('hahaha');
      currentUserId = auth.currentUser!.uid.toString();
      print(currentUserId);
      final QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('Movies').get();
      ftdTotal = qSnap.docs.length.toString();
      print('hahaha');
      final QuerySnapshot qSnap1 = await FirebaseFirestore.instance.collection('Movies').where("genre", arrayContains: 'Web-Series').get();
      ftdWebseries = qSnap1.docs.length.toString();
      final QuerySnapshot qSnap2 = await FirebaseFirestore.instance.collection('Movies').where("genre", arrayContains: 'Anime').get();
      ftdAnime= qSnap2.docs.length.toString();
      final QuerySnapshot qSnap3 = await FirebaseFirestore.instance.collection('Movies').where('year', isEqualTo:currentYr)
          .get();
      ftdThisYr= qSnap3.docs.length.toString();
      final QuerySnapshot qSnap4 = await FirebaseFirestore.instance.collection('Movies').where('month', isEqualTo:currentMonth).where('year', isEqualTo:currentYr)
          .get();
      ftdThisMonth= qSnap4.docs.length.toString();
      final QuerySnapshot qSnap5 = await FirebaseFirestore.instance.collection('Movies').where('chinku-pending', isEqualTo:true)
          .get();
      chinkuNotiCount= qSnap5.docs.length.toString();
      final QuerySnapshot qSnap6 = await FirebaseFirestore.instance.collection('Movies').where('snow-pending', isEqualTo:true)
          .get();
      snowNotiCount= qSnap6.docs.length.toString();
      print('hahaha');
      print(chinkuNotiCount);
      Navigator.pushNamed(context, 'home');
    }else{
      Navigator.pushNamed(context, 'login_screen');
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    getValidationData().whenComplete(()async{
      _playVideo();
    });

  }
  Future getValidationData() async{
final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
var obtainedEmail = sharedPreferences.getString('email');
setState(() {
  finalEmail =obtainedEmail!;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Container(
        color: Color(0xff477b72),
        child: Center(
          child: Image.asset('lib/images/flick logo.png',height: 200,width: 200,),
          ),
        ),


    );
  }
}