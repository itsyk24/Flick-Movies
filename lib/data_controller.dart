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
  Future getNotiData(bool queryString)async{
    return FirebaseFirestore.instance
        .collection('Movies')
        .where('chinku-pending', isEqualTo: queryString)
        .get();
  }
  getData(String filterYr)async{
   return  FirebaseFirestore.instance
        .collection('Movies')
        .where('year', isEqualTo:filterYr)
        .get();
  }
}

