import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick2movies/constants.dart';
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
      Navigator.pushNamed(context, 'home');
      final FirebaseAuth auth = FirebaseAuth.instance;
      currentUserId = auth.currentUser!.uid.toString();
      print(currentUserId);

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