import 'package:flick2movies/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flick2movies/components/carousal_block.dart';
import 'package:flick2movies/constants.dart';
class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color:  Color(0xfff6f6f6),
        child: Column(
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
            )

          ],
        ),
      ),
    );
  }
}


