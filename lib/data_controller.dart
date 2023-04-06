import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';

class DataController extends GetxController{
  Future getdata(String collection)async{
    final FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }
  Future queryData(String queryString)async{
    return FirebaseFirestore.instance
        .collection('Movies')
        .where('name', isGreaterThanOrEqualTo: queryString)
        .get();
  }
  Future getGenreData(String queryString)async{
    return FirebaseFirestore.instance
        .collection('Movies')
        .where("genre", arrayContains: queryString).get();
  }
  Future getLanData(String queryString)async{
    return FirebaseFirestore.instance
        .collection('Movies')
        .where('language', isEqualTo: queryString)
        .get();
  }
  Future getchinkuNotiData(bool queryString)async{
    return FirebaseFirestore.instance
        .collection('Movies')
        .where('chinku-pending', isEqualTo: queryString)
        .get();
  }
  Future getsnowNotiData(bool queryString)async{
    return FirebaseFirestore.instance
        .collection('Movies')
        .where('snow-pending', isEqualTo: queryString)
        .get();
  }
  getData(String filterYr)async{
   return  FirebaseFirestore.instance
        .collection('Movies')
        .where('year', isEqualTo:filterYr)
        .get();
  }
  getRlsYrData(String filterYr)async{
    return  FirebaseFirestore.instance
        .collection('Movies')
        .where('year-of-release', isEqualTo:filterYr)
        .get();
  }
  getchinkufavData()async{
    return  FirebaseFirestore.instance
        .collection('Movies')
        .where('chinku-fav', isEqualTo:true)
        .get();
  }
  // getonlyMovieData()async{
  //   return FirebaseFirestore.instance
  //       .collection('Movies')
  //       .where("genre",arrayContainsAny :{'Anime' ,'Web-Series'})
  //       .get();
  // }
  getmoriartyfavData()async{
    return  FirebaseFirestore.instance
        .collection('Movies')
        .where('snow-fav', isEqualTo:true)
        .get();
  }
  getWatchData(String filterYr, String filterMon)async{
    if(filterYr == 'All'&& filterMon== 'All'){
      return FirebaseFirestore.instance
          .collection('Movies')
          .get();
    }
    if(filterYr == 'All'&& filterMon!= 'All'){
      return FirebaseFirestore.instance
    .collection('Movies')
        .where('month', isEqualTo:filterMon)
        .get();
    }
    if(filterYr != 'All'&& filterMon== 'All'){
      return FirebaseFirestore.instance
          .collection('Movies')
          .where('year', isEqualTo:filterYr)
          .get();
    }
    if(filterYr != 'All'&& filterMon!= 'All'){
      return FirebaseFirestore.instance
          .collection('Movies')
          .where('year', isEqualTo:filterYr)
          .where('month', isEqualTo:filterMon)
          .get();
    }
  }
}

