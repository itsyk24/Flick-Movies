import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flick2movies/constants.dart';
import 'package:flick2movies/data_controller.dart';
class FilterResults extends StatefulWidget {
  const FilterResults({Key? key}) : super(key: key);

  @override
  State<FilterResults> createState() => _FilterResultsState();
}

class _FilterResultsState extends State<FilterResults> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:AppBar(
          title: Text('Filter Results'),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: ListView.builder(itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: GestureDetector(
                    onTap: (){
                      currentMovie = snapData.docs[index]['name'].toString();
                      currentMovieGenre = snapData.docs[index]['genre'];
                      currentMovieLan=snapData.docs[index]['language'];
                      currentMovieChinkuRt=snapData.docs[index]['chinku-rating'];
                      currentMovieSnowRt=snapData.docs[index]['snow-rating'];
                      currentMovieRlsYr=snapData.docs[index]['year-of-release'];
                      currentMovieWtchYr=snapData.docs[index]['year'];

                      Navigator.pushNamed(context, 'movie_details');
                    },
                    child: Material(
                      elevation: 3.0,
                      shadowColor: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ListTile(
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RatingBar.builder(
                                unratedColor: Colors.grey,
                                itemSize: 15,
                                initialRating: double.parse(snapData.docs[index]['chinku-rating']),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Color(0xffff738f),
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },

                              ),
                              RatingBar.builder(
                                unratedColor: Colors.grey,
                                allowHalfRating: true,
                                itemSize: 15,
                                initialRating: double.parse(snapData.docs[index]['snow-rating']),
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                tapOnlyMode: true,
                                ignoreGestures: true,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Color(0xff477b72),
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },

                              ),

                            ],
                          ),
                          tileColor: Colors.white,
                          leading:Icon(Icons.movie,color:Color(0xff1FAF9A),),
                          title: Text('${snapData.docs[index]['name']} (${snapData.docs[index]['year-of-release']})'  ,style:TextStyle(
                              color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
                          ) ),
                          subtitle: Text(snapData.docs[index]['year'],style:TextStyle(
                              color: Color(0xff848585A),fontSize: 12,fontWeight: FontWeight.bold
                          ) ),
                        ),
                      ),
                    ),
                  ),
                );
        })
              ) ],
          ),
        ),
      );
  }
}
