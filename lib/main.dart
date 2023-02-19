import 'package:flick2movies/screens/filter_results.dart';
import 'package:flick2movies/screens/home_screen.dart';
import 'package:flick2movies/screens/login_screen.dart';
import 'package:flick2movies/screens/movie_details_screen.dart';
import 'package:flick2movies/screens/splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flash_chat/screens/welcome_screen.dart';
// import 'package:flash_chat/screens/login_screen.dart';
// import 'package:flash_chat/screens/registration_screen.dart';
// import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(

      ),
      initialRoute:'splash' ,
      routes: {
        // 'welcome_screen':(context) =>WelcomeScreen(),
        'login_screen':(context) =>LoginScreen(),
        'home':(context) =>HomeScreen(),
        'movie_details':(context) =>MovieDetailsScreen(),
        'filter-results':(context) =>FilterResults(),
        'splash':(context) => SplashScreen()


      },

    );
  }
}

