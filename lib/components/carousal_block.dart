import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flick2movies/data_controller.dart';
class CarousalBlock extends StatelessWidget {
  CarousalBlock(
      this.caption,this.num,this.imageurl,this.onTap
      );

  final String caption;
  final String num;
  final String imageurl;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
        init: DataController(),
        builder: (val){
          return GestureDetector(
            onTap:onTap ,
            child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(num,style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.w600),),
                      SizedBox(height: 0,),
                      Text(caption,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                        image: NetworkImage(imageurl),
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),

                        fit: BoxFit.cover
                    )
                )

            ),
          );
        }
    );
  }
}


