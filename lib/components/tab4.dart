import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick2movies/data_controller.dart';
import 'package:flick2movies/constants.dart';
class RlsTab extends StatefulWidget {
  const RlsTab({Key? key}) : super(key: key);

  @override
  State<RlsTab> createState() => _RlsTabState();
}

class _RlsTabState extends State<RlsTab> {
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
  String selected1Yr = '';
  String showYear = 'Year of Release';
  DateTime selectedYear = DateTime.now();
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

selected1Yr=dateTime.year.toString();
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
    return Container(
      color: Color(0xfff6f6f6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            GestureDetector(
              onTap: () {
                selectYear(context);
               selected1Yr=selectedYear.year.toString();
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
                           val.getRlsYrData(selected1Yr.toString()).then((value) {
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
