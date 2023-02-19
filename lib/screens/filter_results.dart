import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick2movies/data_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flick2movies/constants.dart';
class FilterResults extends StatefulWidget {
  const FilterResults({Key? key}) : super(key: key);

  @override
  State<FilterResults> createState() => _FilterResultsState();
}

class _FilterResultsState extends State<FilterResults> {
  late QuerySnapshot snapshotData;
  bool isExecuted = false;
  @override
  Widget build(BuildContext context) {

    Widget SearchedData(){
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: GestureDetector(
                onTap: (){
                  currentMovie = snapshotData.docs[index]['name'].toString();
                  currentMovieGenre = snapshotData.docs[index]['genre'];
                  currentMovieLan=snapshotData.docs[index]['language'];
                  currentMovieChinkuRt=snapshotData.docs[index]['chinku-rating'];
                  currentMovieSnowRt=snapshotData.docs[index]['snow-rating'];
                  currentMovieRlsYr=snapshotData.docs[index]['year-of-release'];
                  currentMovieWtchYr=snapshotData.docs[index]['year'];

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
                            itemSize: 15,
                            initialRating: double.parse(snapshotData.docs[index]['chinku-rating']),
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
                            allowHalfRating: true,
                            itemSize: 15,
                            initialRating: double.parse(snapshotData.docs[index]['snow-rating']),
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
                      title: Text('${snapshotData.docs[index]['name']} (${snapshotData.docs[index]['year-of-release']})'  ,style:TextStyle(
                          color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
                      ) ),
                      subtitle: Text(snapshotData.docs[index]['year'],style:TextStyle(
                          color: Color(0xff848585A),fontSize: 12,fontWeight: FontWeight.bold
                      ) ),
                    ),
                  ),
                ),
              ),
            );
          }
      );
    }

    return Scaffold(
      backgroundColor:Color(0xfff6f6f6),
      body: isExecuted ? SearchedData() : Container(color: Color(0xfff6f6f6),
        child: Center(
          child: Text(
            'No Results Found',style: TextStyle(
              color: Colors.black,fontSize: 25
          ),
          ),
        ),
      ),
      // floatingActionButton:
      // FloatingActionButton(child: Icon(Icons.clear),onPressed: (){
      //   setState(() {
      //     isExecuted =false;
      //   });
      // },),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Filter Results',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
