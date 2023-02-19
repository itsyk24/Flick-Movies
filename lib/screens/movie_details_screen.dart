import 'package:flick2movies/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}
late QuerySnapshot snapshotData;
class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  elevation: 0,
backgroundColor: Color(0xfff6f6f6),
  automaticallyImplyLeading: true,
  foregroundColor: Colors.black,
),
      body: Container(
        color: Color(0xfff6f6f6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,

                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/newscms/2019_52/3159416/191223-end-of-decade-cinema-main-kh.jpg'),
                        fit: BoxFit.cover,
                      ),

                      borderRadius: BorderRadius.all(Radius.circular(20))
                  )
              ),
              SizedBox(height: 10,),
              Text('${currentMovie} (${currentMovieRlsYr})',style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
