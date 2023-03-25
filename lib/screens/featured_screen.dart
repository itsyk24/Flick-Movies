import 'package:flick2movies/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flick2movies/components/carousal_block.dart';
import 'package:flick2movies/constants.dart';
import 'package:flick2movies/components/tab1.dart';
import 'package:flick2movies/components/tab2.dart';
class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  String dropdownvalue = '2023';
  bool drop0trigger = false;
  String dropdownvalue1 = 'January';
  bool drop1trigger = false;
  String dropdownvalue2 = 'English';
  bool drop2trigger = false;
  String movieName='';
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
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color:  Color(0xfff6f6f6),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('lib/images/flick logo.png',height: 80,width: 80,),
                      Text('Flick Movies',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20  ),),
                    ],
                  ),
                  GetBuilder<DataController>(
                      init: DataController(),
                      builder: (val){
                        return IconButton(onPressed: (){
                          val.getNotiData(true).then((value) {
                            snapData=value;
                            setState(() {
                              Navigator.pushNamed(context,'filter-results');
                            });
                          });
                        }, icon: Icon(Icons.notifications_active,size: 30,),color: Colors.pinkAccent,);
                      }
                  ),
                ],
              ),

              SizedBox(height: 0,),
              CarouselSlider(
                  items: [
                    CarousalBlock('Movies', 'Flick',
                        'https://people.com/thmb/SsUCyuqzk84QiYqeOCf9SX8pjQ0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(749x0:751x2)/cruise-kilmer-2-3c342ca61f9e47c9a737d51b8a3de70f.jpg'
                    ),
                    CarousalBlock('Movies', '432',
                        'https://media.timeout.com/images/100654045/image.jpg'
                    ),
                    CarousalBlock('This Year', '432',
                        'https://media-assets.wired.it/photos/615f31bbadb81ae4f94c6b46/16:9/w_2580,c_limit/1519651737_the-office.jpg'
                    ),
                    CarousalBlock('This Month', '132',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR50rZYdLpxK9BZI6VyZlocDRhu0JmniJuNWFy1S8pf88_t9jShJBpF2qsHQ-k-zGBHrBA&usqp=CAU'
                    ),
                    CarousalBlock('Web Series', '374',
                      'https://brignews.com/wp-content/uploads/2020/07/hkrdjji8rk1kziavmu7pnmtkfdf.jpg'
                    ),
                    CarousalBlock('Anime', '12',
                        'https://dailyanimeart.files.wordpress.com/2013/05/the_face_off_by_dbsoul-d65u2d3.png'
                    ),

                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 350,
                    autoPlayCurve: Curves.easeInOut,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85,
                      autoPlayInterval:const Duration(seconds: 2)

                  )
              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.grey.shade600,
                height: 10,
                thickness: 1,
              ),
              SizedBox(height: 10,),
              Text('Favorites',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                         Container(
                           width: 140,
                           height: 150,
                           decoration: BoxDecoration(
                             color: Colors.blueAccent.shade200,
                             image: DecorationImage(image:  ExactAssetImage('lib/images/moriarty joker.png')),
                             borderRadius:BorderRadius.all(Radius.circular(30)),
                             border: Border.all(
                               color:Colors.grey,
                               width: 1,
                             ),
                           ),
                         ),
                        ],
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 140,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.shade200,
                            image: DecorationImage(image:  ExactAssetImage('lib/images/nez joker.png')),
                            borderRadius:BorderRadius.all(Radius.circular(30)),
                            border: Border.all(
                              color:Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.grey.shade600,
                height: 10,
                thickness: 1,
              ),
              SizedBox(height: 10,),
              Text('Filters',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Watched on:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),

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
                            hint: Text('Month',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                            iconEnabledColor: Colors.grey[600],
                            value: drop1trigger?dropdownvalue1:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),

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
                    ),

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
                            hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                            iconEnabledColor: Colors.grey[600],
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
                        )
                      ),
                    ),

                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor:  Color(0xff477b72),
                          onPressed: () {},
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 40,
                            color:  Color(0xfff6f6f6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('year of release:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),


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
                              hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                              iconEnabledColor: Colors.grey[600],
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
                          )
                      ),
                    ),

                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor:  Color(0xff477b72),
                          onPressed: () {},
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 40,
                            color:  Color(0xfff6f6f6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('language:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),


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
                              hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                              iconEnabledColor: Colors.grey[600],
                              value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),

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
                                  drop0trigger=true;
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          )
                      ),
                    ),

                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor:  Color(0xff477b72),
                          onPressed: () {},
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 40,
                            color:  Color(0xfff6f6f6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Genre:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),


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
                              hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
                              iconEnabledColor: Colors.grey[600],
                              value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),

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
                                  drop0trigger=true;
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          )
                      ),
                    ),

                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor:  Color(0xff477b72),
                          onPressed: () {},
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 40,
                            color:  Color(0xfff6f6f6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.grey.shade600,
                height: 10,
                thickness: 1,
              ),
              SizedBox(height: 10,),

              /////
              // SizedBox(height: 50),
              Container(
                // height: 50,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.black,
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        controller: tabController,
                        tabs: [
                          Tab(
                            text: 'Tab 1',
                          ),
                          Tab(
                            text: 'Tab 1',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Tab1(),
                    Tab2(),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


