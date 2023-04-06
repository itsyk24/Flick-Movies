import 'package:flutter/material.dart';
import 'package:flick2movies/components/profile_widget.dart';
import 'package:flick2movies/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Color(0xfff6f6f6),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(currentUserId ==snowId)Container(
                      width: 150,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        backgroundImage: ExactAssetImage('lib/images/moriarty joker.png'),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Constants.blackColor.withOpacity(.5),
                          width: 1,
                        ),
                      ),
                    ),
                    if(currentUserId ==chinkuId)Container(
                      width: 150,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        backgroundImage: ExactAssetImage('lib/images/nez joker.png'),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Constants.blackColor.withOpacity(.5),
                          width: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    if(currentUserId ==snowId)SizedBox(
                      child: Text(
                        'Moriarty',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    if(currentUserId ==chinkuId)SizedBox(
                      child: Text(
                        'Nez',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    if(currentUserId ==snowId)Text(
                      'itsyk24@gmail.com',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(.3),
                      ),
                    ),
                    if(currentUserId ==chinkuId)Text(
                      'nezmariam04@gmail.com',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(.3),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          ProfileWidget(
                            onTap: (){
                            },
                            icon: Icons.person,
                            title: 'My Profile',
                          ),
                          ProfileWidget(
                            onTap: (){

                            },
                            icon: Icons.settings,
                            title: 'Settings',
                          ),
                          ProfileWidget(
                            onTap: (){

                            },
                            icon: Icons.notifications,
                            title: 'Notifications',
                          ),
                          ProfileWidget(
                            onTap: (){

                            },
                            icon: Icons.chat,
                            title: 'FAQs',
                          ),
                          ProfileWidget(
                            onTap: (){

                            },
                            icon: Icons.share,
                            title: 'Share',
                          ),
                          ProfileWidget(
                            onTap: ()async{

                              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                              print (sharedPreferences.getString('email'));
                              sharedPreferences.remove('email');

                              Navigator.pushNamed(context,'login_screen');

                            },
                            icon: Icons.logout,
                            title: 'Log Out',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
