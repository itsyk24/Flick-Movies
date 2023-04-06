import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick2movies/data_controller.dart';
import 'package:flick2movies/constants.dart';
class GenreTab extends StatefulWidget {
  const GenreTab({Key? key}) : super(key: key);

  @override
  State<GenreTab> createState() => _GenreTabState();
}

class _GenreTabState extends State<GenreTab> {
  String dropdownvalue = 'Drama';

  bool drop0trigger = false;

  // String dropdownvalue1 = 'January';
  //
  // bool drop1trigger = false;
  //
  // String dropdownvalue2 = 'English';
  //
  // bool drop2trigger = false;
  //
  // String movieName='';

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
  var genre1list = ['Web-Series','Anime','Romance','War','Mystery','Action','Adventure','Musical','Documentry','Crime','Drama','Comedy','War','Thriller'];

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff6f6f6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            DecoratedBox(
              decoration:BoxDecoration(
                  color:  Color(0xfff6f6f6), //background color of dropdown button
                  border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
                  borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                  boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                        blurRadius:0) //blur radius of shadow
                  ]
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      iconSize: 30,
                      // Initial Value
                      hint: Text('Select Genre',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                      iconEnabledColor: Colors.grey[600],
                      value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),

                      // Array list of items
                      items: genre1list.map((String items) {
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
                  )
              ),
            ),

            GetBuilder<DataController>(
                init: DataController(),
                builder: (val){
                  return SizedBox(
                    width: 40,
                    height: 40,
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor:  Color(0xff477b72),
                        onPressed: () {
                          val.getGenreData(dropdownvalue).then((value) {
                            snapData=value;
                            setState(() {
                              Navigator.pushNamed(context,'filter-results');
                            });
                          });
                        },
                        child: Icon(
                          Icons.filter_alt_outlined,
                          size: 40,
                          color:  Color(0xfff6f6f6),
                        ),
                      ),
                    ),
                  );
                }
            ),


          ],
        ),
      ),
    );
  }
}