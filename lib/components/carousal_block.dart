import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CarousalBlock extends StatelessWidget {
  CarousalBlock(
      this.caption,this.num,this.imageurl
      );

  final String caption;
  final String num;
  final String imageurl;


  @override
  Widget build(BuildContext context) {
    return Container(
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

    );
  }
}