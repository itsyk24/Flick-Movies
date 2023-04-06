import 'package:flick2movies/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flick2movies/components/carousal_block.dart';
import 'package:flick2movies/constants.dart';
import 'package:flick2movies/components/tab1.dart';
import 'package:flick2movies/components/tab2.dart';
import 'package:flick2movies/components/tab3.dart';
import 'package:flick2movies/components/tab4.dart';
class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

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
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('lib/images/flick logo.png',height: 80,width: 80,),
                      Text('Flick Movies',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20  ),),
                    ],
                  ),
                  if(currentUserId ==chinkuId && int.parse(chinkuNotiCount)>0)GetBuilder<DataController>(
                      init: DataController(),
                      builder: (val){
                        return IconButton(onPressed: (){
                          val.getchinkuNotiData(true).then((value) {
                            snapData=value;
                            setState(() {
                              print(currentYr);
                              Navigator.pushNamed(context,'filter-results');
                            });
                          });
                        }, icon: Icon(Icons.notifications_active,size: 30,),
                          color: Colors.redAccent,);
                      }
                  ),
                  if(currentUserId ==chinkuId && int.parse(chinkuNotiCount)==0)GetBuilder<DataController>(
                      init: DataController(),
                      builder: (val){
                        return IconButton(onPressed: (){

                        },  icon: Icon(Icons.notifications,size: 30,),
                          color: Colors.grey,);
                      }
                  ),
                  if(currentUserId ==snowId && int.parse(snowNotiCount)>0)GetBuilder<DataController>(
                      init: DataController(),
                      builder: (val){
                        return IconButton(onPressed: (){
                          val.getsnowNotiData(true).then((value) {
                            snapData=value;
                            setState(() {
                              print(currentYr);
                              Navigator.pushNamed(context,'filter-results');
                            });
                          });
                        }, icon: Icon(Icons.notifications_active,size: 30,),
                          color: Colors.redAccent,);
                      }
                  ),
                  if(currentUserId ==snowId && int.parse(snowNotiCount)==0)GetBuilder<DataController>(
                      init: DataController(),
                      builder: (val){
                        return IconButton(onPressed: (){
                        }, icon: Icon(Icons.notifications,size: 30,),
                          color: Colors.grey,);
                      }
                  ),
                ],
              ),

              SizedBox(height: 0,),
              CarouselSlider(
                  items: [
    GetBuilder<DataController>(
    init: DataController(),
    builder: (val){
    return CarousalBlock('Movies', 'Flick',
                        'https://people.com/thmb/SsUCyuqzk84QiYqeOCf9SX8pjQ0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(749x0:751x2)/cruise-kilmer-2-3c342ca61f9e47c9a737d51b8a3de70f.jpg',
                        (){}
                    );}),
    GetBuilder<DataController>(
    init: DataController(),
    builder: (val){
    return CarousalBlock('Total', ftdTotal.toString(),
                        'https://www.flickeringmyth.com/wp-content/uploads/2020/08/keanu-reeves-john-wick.png',
                            (){
          val.getWatchData('All', 'All').then((value) {

            print(currentYear);


            snapData=value;
            setState(() {
              Navigator.pushNamed(context,'filter-results');
            });
          });
        }
                    );}),
    GetBuilder<DataController>(
    init: DataController(),
    builder: (val){
    return CarousalBlock('Movies', '${int.parse(ftdTotal)-int.parse(ftdWebseries)}',
                        'https://media.timeout.com/images/100654045/image.jpg',
                            (){

        }
                    );}),
                    GetBuilder<DataController>(
                    init: DataController(),
    builder: (val){
    return CarousalBlock('This Year', ftdThisYr,
                        'https://media-assets.wired.it/photos/615f31bbadb81ae4f94c6b46/16:9/w_2580,c_limit/1519651737_the-office.jpg',
                            (){
                              val.getWatchData(currentYear.toString(), 'All').then((value) {

                                print(currentYear);


                                snapData=value;
                                setState(() {
                                  Navigator.pushNamed(context,'filter-results');
                                });
                              });
                            }
                    );}),
                    GetBuilder<DataController>(
                    init: DataController(),
    builder: (val){
    return CarousalBlock('This Month', ftdThisMonth,
                        'https://s.abcnews.com/images/Entertainment/HT-godfatrher-jef-170308_16x9_1600.jpg',
                            (){
                              final currentMonth =  currMonths[DateTime.now().month-1];
                              val.getWatchData(currentYear.toString(), currentMonth).then((value) {

                                print(currentMonth);


                                snapData=value;
                                setState(() {
                                  Navigator.pushNamed(context,'filter-results');
                                });
                              });
                            }
                    );}),
                    GetBuilder<DataController>(
                    init: DataController(),
    builder: (val){
    return CarousalBlock('Web Series', ftdWebseries,
                      'https://brignews.com/wp-content/uploads/2020/07/hkrdjji8rk1kziavmu7pnmtkfdf.jpg',
                            (){
                              val.getGenreData('Web-Series').then((value) {
                                snapData=value;
                                setState(() {
                                  Navigator.pushNamed(context,'filter-results');
                                });
                              });
                            }
                    );}),
                    GetBuilder<DataController>(
                    init: DataController(),
    builder: (val){
    return CarousalBlock('Anime', ftdAnime,
                        'https://dailyanimeart.files.wordpress.com/2013/05/the_face_off_by_dbsoul-d65u2d3.png',
                            (){
                              val.getGenreData('Anime').then((value) {
                                snapData=value;
                                setState(() {
                                  Navigator.pushNamed(context,'filter-results');
                                });
                              });
                            }
                    );}),

                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 400,
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
                // thickness: 1,
              ),
              SizedBox(height: 10,),
              Text('Favorites',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<DataController>(
                      init: DataController(),
                      builder: (val){
                        return  GestureDetector(
                          onTap: (){
                            val.getmoriartyfavData().then((value) {
                              snapData=value;
                              setState(() {
                                Navigator.pushNamed(context,'filter-results');
                              });
                            });
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
                        );
                      }
                  ),
          GetBuilder<DataController>(
              init: DataController(),
              builder: (val){
                return GestureDetector(
                  onTap: (){
                    val.getchinkufavData().then((value) {
                      snapData=value;
                      setState(() {
                        Navigator.pushNamed(context,'filter-results');
                      });
                    });
                  },
                  child: Padding(
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
                );
              }
          )




                ],
              ),
              // SizedBox(height: 10,),
              // Divider(
              //   color: Colors.grey.shade600,
              //   height: 10,
              //   thickness: 1,
              // ),
              // SizedBox(height: 10,),
              // Text('Filters',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
              // SizedBox(height: 5,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('Watched on:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
              //
              //       DecoratedBox(
              //         decoration:BoxDecoration(
              //             color:  Color(0xfff6f6f6), //background color of dropdown button
              //             border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
              //             borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
              //             boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
              //               BoxShadow(
              //                   color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
              //                   blurRadius:0) //blur radius of shadow
              //             ]
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 12),
              //           child: DropdownButtonHideUnderline(
              //             child: DropdownButton(
              //               iconSize: 30,
              //               // Initial Value
              //               hint: Text('Month',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
              //               iconEnabledColor: Colors.grey[600],
              //               value: drop1trigger?dropdownvalue1:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),
              //
              //               // Array list of items
              //               items: watchmonths.map((String items) {
              //                 return DropdownMenuItem(
              //                   value: items,
              //                   child: Text(items),
              //                 );
              //               }).toList(),
              //               // After selecting the desired option,it will
              //               // change button value to selected value
              //               onChanged: (String? newValue) {
              //                 setState(() {
              //                   drop1trigger=true;
              //                   dropdownvalue1 = newValue!;
              //                 });
              //               },
              //             ),
              //           ),
              //         ),
              //       ),
              //
              //       DecoratedBox(
              //         decoration:BoxDecoration(
              //             color:  Color(0xfff6f6f6), //background color of dropdown button
              //             border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
              //             borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
              //             boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
              //               BoxShadow(
              //                   color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
              //                   blurRadius:0) //blur radius of shadow
              //             ]
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 12),
              //           child: DropdownButtonHideUnderline(
              //             child: DropdownButton(
              //               iconSize: 30,
              //               // Initial Value
              //               hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
              //               iconEnabledColor: Colors.grey[600],
              //               value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),
              //
              //               // Array list of items
              //               items: watchyrs.map((String items) {
              //                 return DropdownMenuItem(
              //                   value: items,
              //                   child: Text(items),
              //                 );
              //               }).toList(),
              //               // After selecting the desired option,it will
              //               // change button value to selected value
              //               onChanged: (String? newValue) {
              //                 setState(() {
              //                   drop0trigger=true;
              //                   dropdownvalue = newValue!;
              //                 });
              //               },
              //             ),
              //           )
              //         ),
              //       ),
              //
              //       SizedBox(
              //         width: 40,
              //         height: 40,
              //         child: FittedBox(
              //           child: FloatingActionButton(
              //             backgroundColor:  Color(0xff477b72),
              //             onPressed: () {},
              //             child: Icon(
              //               Icons.filter_alt_outlined,
              //               size: 40,
              //               color:  Color(0xfff6f6f6),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              //
              // ),
              // SizedBox(height: 5,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('year of release:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
              //
              //
              //       DecoratedBox(
              //         decoration:BoxDecoration(
              //             color:  Color(0xfff6f6f6), //background color of dropdown button
              //             border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
              //             borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
              //             boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
              //               BoxShadow(
              //                   color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
              //                   blurRadius:0) //blur radius of shadow
              //             ]
              //         ),
              //         child: Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 12),
              //             child: DropdownButtonHideUnderline(
              //               child: DropdownButton(
              //                 iconSize: 30,
              //                 // Initial Value
              //                 hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
              //                 iconEnabledColor: Colors.grey[600],
              //                 value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),
              //
              //                 // Array list of items
              //                 items: watchyrs.map((String items) {
              //                   return DropdownMenuItem(
              //                     value: items,
              //                     child: Text(items),
              //                   );
              //                 }).toList(),
              //                 // After selecting the desired option,it will
              //                 // change button value to selected value
              //                 onChanged: (String? newValue) {
              //                   setState(() {
              //                     drop0trigger=true;
              //                     dropdownvalue = newValue!;
              //                   });
              //                 },
              //               ),
              //             )
              //         ),
              //       ),
              //
              //       SizedBox(
              //         width: 40,
              //         height: 40,
              //         child: FittedBox(
              //           child: FloatingActionButton(
              //             backgroundColor:  Color(0xff477b72),
              //             onPressed: () {},
              //             child: Icon(
              //               Icons.filter_alt_outlined,
              //               size: 40,
              //               color:  Color(0xfff6f6f6),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              //
              // ),
              // SizedBox(height: 5,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('language:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
              //
              //
              //       DecoratedBox(
              //         decoration:BoxDecoration(
              //             color:  Color(0xfff6f6f6), //background color of dropdown button
              //             border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
              //             borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
              //             boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
              //               BoxShadow(
              //                   color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
              //                   blurRadius:0) //blur radius of shadow
              //             ]
              //         ),
              //         child: Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 12),
              //             child: DropdownButtonHideUnderline(
              //               child: DropdownButton(
              //                 iconSize: 30,
              //                 // Initial Value
              //                 hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
              //                 iconEnabledColor: Colors.grey[600],
              //                 value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),
              //
              //                 // Array list of items
              //                 items: watchmonths.map((String items) {
              //                   return DropdownMenuItem(
              //                     value: items,
              //                     child: Text(items),
              //                   );
              //                 }).toList(),
              //                 // After selecting the desired option,it will
              //                 // change button value to selected value
              //                 onChanged: (String? newValue) {
              //                   setState(() {
              //                     drop0trigger=true;
              //                     dropdownvalue = newValue!;
              //                   });
              //                 },
              //               ),
              //             )
              //         ),
              //       ),
              //
              //       SizedBox(
              //         width: 40,
              //         height: 40,
              //         child: FittedBox(
              //           child: FloatingActionButton(
              //             backgroundColor:  Color(0xff477b72),
              //             onPressed: () {},
              //             child: Icon(
              //               Icons.filter_alt_outlined,
              //               size: 40,
              //               color:  Color(0xfff6f6f6),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              //
              // ),
              // SizedBox(height: 5,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('Genre:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
              //
              //
              //       DecoratedBox(
              //         decoration:BoxDecoration(
              //             color:  Color(0xfff6f6f6), //background color of dropdown button
              //             border: Border.all(color: Colors.grey.shade600, width:2), //border of dropdown button
              //             borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
              //             boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
              //               BoxShadow(
              //                   color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
              //                   blurRadius:0) //blur radius of shadow
              //             ]
              //         ),
              //         child: Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 12),
              //             child: DropdownButtonHideUnderline(
              //               child: DropdownButton(
              //                 iconSize: 30,
              //                 // Initial Value
              //                 hint: Text('Year',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700)),
              //                 iconEnabledColor: Colors.grey[600],
              //                 value: drop0trigger?dropdownvalue:null,style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w700),
              //
              //                 // Array list of items
              //                 items: watchmonths.map((String items) {
              //                   return DropdownMenuItem(
              //                     value: items,
              //                     child: Text(items),
              //                   );
              //                 }).toList(),
              //                 // After selecting the desired option,it will
              //                 // change button value to selected value
              //                 onChanged: (String? newValue) {
              //                   setState(() {
              //                     drop0trigger=true;
              //                     dropdownvalue = newValue!;
              //                   });
              //                 },
              //               ),
              //             )
              //         ),
              //       ),
              //
              //       SizedBox(
              //         width: 40,
              //         height: 40,
              //         child: FittedBox(
              //           child: FloatingActionButton(
              //             backgroundColor:  Color(0xff477b72),
              //             onPressed: () {},
              //             child: Icon(
              //               Icons.filter_alt_outlined,
              //               size: 40,
              //               color:  Color(0xfff6f6f6),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),

              // ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.grey.shade600,
                height: 10,
                // thickness: 1,
              ),


              Text('Filters',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              /////
              // SizedBox(height: 50),
              Container(
                // height: 50,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Color(0xff477b72),
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
                            text: 'Genre',
                          ),
                          Tab(
                            text: 'Language',
                          ),
                          Tab(
                            text: 'Watched',
                          ),
                          Tab(
                            text: 'Release',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    GenreTab(),
                    LanguageTab(),
                    WatchyrTab(),
                    RlsTab(),

                  ],
                ),
              ),
              SizedBox(height: 0,),
              Divider(
                color: Colors.grey.shade600,
                height: 10,
                // thickness: 1,
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}




