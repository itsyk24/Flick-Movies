import 'package:flick2movies/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
              // SizedBox(height: 10,),
              Row(
                children: [
                  TextButton(title:currentMovieLan ,
                  colour: Color(0xff477b72),
                  onPressed: (){
                  },),
                  SizedBox(width: 5,),
                  TextButton(title:'Watched on: ${currentMovieWtchYr} ${currentMovieWtchMonth}' ,
                    colour: Color(0xff477b72) ,
                    onPressed: (){
                    },)
                ],
              ),
              Container(
                height: 50.0, // set height as per your requirement
                child:  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: currentMovieGenre
                            .map((num) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:Color(0xff477b72),
                              minimumSize: Size(50.0, 30.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(num.toString()),
                          ),
                        ))
                            .toList(),
                      )
                    ],
                  ),

              ),
              Center(
                child: Column(
                  children: [
                    Text('Chinku\'s Rating',style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                    RatingBar.builder(
                      unratedColor: Colors.grey,
                      allowHalfRating: true,
                      itemSize: 35,
                      initialRating:double.parse(currentMovieChinkuRt),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      tapOnlyMode: true,
                      ignoreGestures: true,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.pinkAccent,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text('Moriarty\'s Rating',style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),),
                    RatingBar.builder(
                      unratedColor: Colors.grey,
                      allowHalfRating: true,
                      itemSize: 35,
                      initialRating:double.parse(currentMovieSnowRt),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      tapOnlyMode: true,
                      ignoreGestures: true,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.blueAccent,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextButton extends StatelessWidget {
  TextButton(
      {required this.title, required this.colour, required this.onPressed});

  final Color colour;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: colour,
        minimumSize: Size(50.0, 30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
