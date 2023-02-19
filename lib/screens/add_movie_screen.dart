import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flick2movies/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}


late String valueChoose;
class _AddMovieScreenState extends State<AddMovieScreen> {
  String dropdownvalue = '2023';
  bool drop0trigger = false;
  String dropdownvalue1 = 'January';
  bool drop1trigger = false;
  String dropdownvalue2 = 'English';
  bool drop2trigger = false;
  String movieName='';
var watchmonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
int i=0;
int j =0;
  List<String> countries = ["Brazil", "Nepal", "India", "China", "USA", "Canada"];
  final List<String> genrelist =<String>['Web-Series','Anime','Mystery','Action','Adventure','Musical','Documentry','Crime','Drama','Comedy','War','Thriller'];
  final List<bool> genreResponse = [false,false,false,false,false,false,false,false,false,false,false,false,];
  List<String> genreFinal =[];
var selectedGenre =[];
  final List<String> entries = <String>['A', ];
  final List<bool> isSelected = [true];

var languageList =[
  'English',
  'Malayalam',
  'Tamil',
  'Hindi',
  'Telugu',
  'French',
  'German',
  'Chinese',
  'Italian',
  'Spanish',
  'Other'
];

  // List of items in our dropdown menu
  var watchyrs = [
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',

  ];
  String showYear = 'Year of Release';
  DateTime selectedYear = DateTime.now();
  String selectedYr = '';
  String chinkuRt = '';
  String snowRt = '';

  selectYear(context) async {
    print("Calling date picker");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              // lastDate: DateTime.now(),
              lastDate: DateTime(2025),
              initialDate: DateTime.now(),
              selectedDate: selectedYear,
              onChanged: (DateTime dateTime) {
                print(dateTime.year);
                setState(() {
                  selectedYear = dateTime;
                  showYear = "${dateTime.year}";
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Color(0xfff6f6f6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),

                Container(
                    height: 150,
                    width: double.infinity,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://static.vecteezy.com/system/resources/previews/011/835/060/non_2x/retro-movie-ticket-png.png'),
                          fit: BoxFit.scaleDown,
                        ),

                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                SizedBox(height: 0,),
                Divider(
                  color: Colors.grey.shade600,
                  height: 10,
                  thickness: 1,
                ),

                Container(
                  child: TextFormField(
                    onChanged: (val){
                      movieName=val;
                    },
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: GestureDetector(child: Icon(Icons.movie,color: Colors.grey.shade600,),onTap: (){
                      },
                      ),
                      labelText: 'Movie Name',
                      labelStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16
                      ),
                    ),
                  ),
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                color:  Color(0xfff6f6f6), //background color of dropdown button
              border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
              borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
              boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                    blurRadius:0) //blur radius of shadow
              ]
          ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: DropdownButton(
                          // style: TextStyle(color: Colors.grey.shade600),
iconEnabledColor: Colors.grey[600],
                          // Initial Value
                          hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),),
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),
                          // Array list of items
                          items: watchyrs.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              drop0trigger=true;
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width:10,),
                    DecoratedBox(
                      decoration:BoxDecoration(
                        color:  Color(0xfff6f6f6), //background color of dropdown button
                        border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
                        borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
                        boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                              blurRadius:0) //blur radius of shadow
                        ]
                    ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButton(
                          // Initial Value
                          hint: Text('Month',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                          iconEnabledColor: Colors.grey[600],
                          value: drop1trigger?dropdownvalue1:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: watchmonths.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              drop1trigger=true;
                              dropdownvalue1 = newValue!;
                            });
                          },
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height:10,),
                GestureDetector(
                  onTap: () {
                    selectYear(context);
                    selectedYr=selectedYear.year.toString();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                        color:  Color(0xfff6f6f6), //background color of dropdown button
                        border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
                        borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
                        boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                              blurRadius:0) //blur radius of shadow
                        ]
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.calendar_month,color: Colors.grey,
                        ),
                        SizedBox(width: 15,),
                        Text(
                          showYear,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height:10,),

                DecoratedBox(
                  decoration: BoxDecoration(
                      color:  Color(0xfff6f6f6), //background color of dropdown button
                      border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
                      borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
                      boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                            blurRadius:0) //blur radius of shadow
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButton(
                      value: drop2trigger?dropdownvalue2:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),
                      hint: Text('Language',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                      iconEnabledColor: Colors.grey[600],
                      // Initial Value
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: languageList.map((String items) {
                        return DropdownMenuItem(

                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          drop2trigger=true;
                          dropdownvalue2 = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: RatingBar.builder(
                    allowHalfRating: true,
                    itemSize: 35,
                    unratedColor: Colors.grey.shade600,
                    initialRating: 4,
                    minRating: 0,
                    direction: Axis.horizontal,
                    itemCount: 5,

                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Color(0xff477b72),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                      chinkuRt = rating.toString();
                    },

                  ),
                ),
                Center(
                  child: RatingBar.builder(
                    allowHalfRating: true,
                    itemSize: 35,
                    unratedColor: Colors.grey.shade600,
                    initialRating: 4,
                    minRating: 0,
                    direction: Axis.horizontal,
                    itemCount: 5,

                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Color(0xff477b72),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                      snowRt = rating.toString();
                    },

                  ),
                ),

                SizedBox(height: 5,),

                Flexible(
                  child: SizedBox(
                    height:60,
                    child: ListView.builder(

                        scrollDirection: Axis.horizontal,
                        shrinkWrap:true,
                        padding: const EdgeInsets.all(0),
                        itemCount: genrelist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [

                              Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: genreResponse[index] ? Color(0xff477b72) : Colors.grey.shade600,
                                  ),

                                  child: ListTile(
                                    isThreeLine: true,
                                    subtitle: Text(''),
                                    horizontalTitleGap: 10,
                                    minLeadingWidth: 0,
                                    minVerticalPadding: 0,
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text('${genrelist[index]}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                                    selected: genreResponse[index],
                                    onTap: () {
                                      setState(() {
                                        genreResponse[index] = !genreResponse[index];
                                      });
                                    },
                                  )
                              ),
                              SizedBox(width: 10,),
                            ],
                          );
                        }),
                  ),
                ),

                // SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child:Row(
                //       children: genrelist.map((country){
                //         return Container(
                //             color: Colors.orangeAccent,
                //             height: 100, width:150,
                //             alignment: Alignment.center,
                //             child: Text(country)
                //         );
                //       }).toList(),
                //     )
                // ),
                Divider(
                  color: Colors.grey.shade600,
                  height: 10,
                  thickness: 1,
                ),

                SizedBox(height: 10,),

                Center(
                  child: FloatingActionButton.extended(
                    label: Text('Add Movie',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),), //// <-- Text
                    backgroundColor: Color(0xff477b72),
                    icon: Icon( // <-- Icon
                      Icons.cloud_upload,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      selectedYr=selectedYear.year.toString();
                      genreFinal=[];
                      for(var i=0; i<12;i++){
                        if(genreResponse[i]==true){
                          genreFinal.add(genrelist[i]);
                        }
                      }
                      print(dropdownvalue);
                      print(dropdownvalue1);
                      print(dropdownvalue2);
                      print(selectedYr);
                      print(movieName);
                      print(chinkuRt);
                      print(snowRt);
                      print(genreFinal);
                      var collection = FirebaseFirestore.instance.collection('Movies');
                      if(chinkuRt!=null&& snowRt!=null && genreFinal.length>0 && movieName!=null){
                        collection
                            .doc(movieName) // <-- Document ID
                            .set(
                          {'chinku-fav': false,
                            'chinku-rating':chinkuRt,
                            'chinku-pending':true,
                            'genre':FieldValue.arrayUnion(genreFinal),
                            'language':dropdownvalue2,
                            'month':dropdownvalue1,
                            'year':dropdownvalue,
                            'name':movieName,
                            'snow-fav': false,
                            'snow-rating':snowRt,
                            'snow-pending':true,
                            'year-of-release':selectedYr

                          },
                        ) // <-- Your data
                            .then((_) => print('Added'))
                            .catchError((error) => print('Add failed: $error'));
                      }else{
                        print('there is some error');
                      }

                    },
                  ),
                ),

              ],

            ),
          ),
        )
      ),
    );
  }
}
