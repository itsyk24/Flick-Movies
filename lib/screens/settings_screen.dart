import 'package:flutter/material.dart';
import 'package:flick2movies/components/profile_widget.dart';
import 'package:flick2movies/constants.dart';
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
                    Container(
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
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        'Moriarty',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      'itsyk24@gmail.com',
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
                        children: const [
                          ProfileWidget(
                            icon: Icons.person,
                            title: 'My Profile',
                          ),
                          ProfileWidget(
                            icon: Icons.settings,
                            title: 'Settings',
                          ),
                          ProfileWidget(
                            icon: Icons.notifications,
                            title: 'Notifications',
                          ),
                          ProfileWidget(
                            icon: Icons.chat,
                            title: 'FAQs',
                          ),
                          ProfileWidget(
                            icon: Icons.share,
                            title: 'Share',
                          ),
                          ProfileWidget(
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
