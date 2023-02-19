import 'package:flutter/material.dart';
import 'package:flick2movies/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flick2movies/components/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showPassword =true;
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            SizedBox(
            height: 30.0),
              Container(
                height: 200.0,
                child: Image.asset('lib/images/flick logo.png'),
              ),
              Center(child: Text('Flick',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 35 ),)),
              Center(child: Text('Movies',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize:25  ),)),
              SizedBox(
                height: 48.0,
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val){
                    email=val;
                  },
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: GestureDetector(child: Icon(Icons.movie,color: Colors.grey.shade600,),onTap: (){
                    },
                    ),
                    labelText: 'Enter Email',
                    labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),

              Container(
                child: TextFormField(
                  obscureText: showPassword,
                  onChanged: (val){
                    password=val;
                  },
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: showPassword?GestureDetector(onTap:(){
                      setState(() {
                        showPassword =false;
                      });
                    },child: Icon(Icons.visibility_off ,color: Colors.grey.shade600,)):GestureDetector(onTap: (){
                      setState(() {
                        showPassword=true;
                      });
                    },child: Icon(Icons.visibility,color: Colors.grey.shade600,)),
                    prefixIcon: Icon(Icons.movie,color: Colors.grey.shade600,),
                    labelText: 'Enter Password',
                    labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                colour: Color(0xff477b72),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setString('email', email);
                      print(user.credential.toString());
                      Navigator.pushNamed(context,'home');
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {

                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}