import 'dart:ui';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';

import 'Images.dart';

class CustomWidgets{
  static showSlideShow(){
    return ImageSlideshow(children: [

       ClipRRect(
         borderRadius: BorderRadius.circular(20),
         child: Image.asset('assets/images/img.png',
          fit: BoxFit.cover,
      ),
       ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/images/img.png',
          fit: BoxFit.cover,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/images/img.png',
          fit: BoxFit.cover,
        ),
      ),
    ],
      isLoop: true,
      autoPlayInterval: 3000,
    );
  }
  static displayText(String text){
    return Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'RaleWay',fontSize: 13),);
  }
  static itemText(String text){
    return Text(text,style: TextStyle(fontSize: 10),overflow: TextOverflow.ellipsis,
      maxLines: 2,
      softWrap: true,);


  }
  static detailText(String text){
    return Text(text,style: TextStyle(fontSize: 14),overflow: TextOverflow.ellipsis,
      maxLines: 2,
      softWrap: true,);


  }
  static homeSlideShow(List<Images> images) {

    return ImageSlideshow(children: [
      for(int i = 0; i < images.length; i++)
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(images[i].image, fit: BoxFit.cover,),

        )
    ]
    );
  }
}