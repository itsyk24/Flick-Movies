import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick2movies/data_controller.dart';
import 'package:flick2movies/constants.dart';
class LanguageTab extends StatefulWidget {
  const LanguageTab({ Key? key }) : super(key: key);

  @override
  State<LanguageTab> createState() => _LanguageTabState();
}

class _LanguageTabState extends State<LanguageTab> {
  String dropdownvalue = 'Drama';

  bool drop0trigger = false;

  var lan1list = [
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
                      hint: Text('Select Language',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                      iconEnabledColor: Colors.grey[600],
                      value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),

                      // Array list of items
                      items: lan1list.map((String items) {
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
                          val.getLanData(dropdownvalue).then((value) {
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