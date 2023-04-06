import 'package:flick2movies/screens/add_movie_screen.dart';
import 'package:flick2movies/screens/featured_screen.dart';
import 'package:flick2movies/screens/search_screen.dart';
import 'package:flick2movies/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flick2movies/constants.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser(){
    final user = _auth.currentUser;
  }
  int _selectedIndex=0;
  List<Widget> get _tabs => const[
    FeaturedScreen(),
    AddMovieScreen(),
    SearchScreen(),
    SettingsScreen()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd7d7db),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
          child: GNav(
            tabBorderRadius: 200,
            padding: EdgeInsets.all(16),
            backgroundColor: Colors.transparent,
            // f7f6f9
            color: Color(0xff1f1f1f),
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xff477b72),
            gap: 8,
            onTabChange: (index){
              setState(() {
                _selectedIndex=index;
                yearList = List.generate((currentYear-startingYear)+1, (index) => startingYear+index);
                print(yearList);
              });
            },
            tabs: [
              GButton(icon: Icons.home, text: 'Home',),
              GButton(icon: Icons.add,iconSize: 30, text: 'Add'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.settings, text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
