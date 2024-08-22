import 'package:ch3_lec6/screen/eigthtask.dart';
import 'package:ch3_lec6/screen/fifthtask.dart';
import 'package:ch3_lec6/screen/firsttask.dart';
import 'package:ch3_lec6/screen/fourtask.dart';
import 'package:ch3_lec6/screen/homepage.dart';
import 'package:ch3_lec6/screen/imagelist_thirdtask.dart';
import 'package:ch3_lec6/screen/ninetask.dart';
import 'package:ch3_lec6/screen/secondtask.dart';
import 'package:ch3_lec6/screen/seventask.dart';
import 'package:ch3_lec6/screen/sixtask.dart';
import 'package:ch3_lec6/screen/tentask.dart';
import 'package:ch3_lec6/screen/thirdtask.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  final List<XFile> dummyImages = []; // Replace with actual data if available
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context){
          return HomePage();
        },
        "firsttask":(context){
          return FirstTask();
        },
        "secondtask":(context){
          return SecondTask();
        },
        "imagelistthirdtask":(context){
          return Imagelist_ThirdTask();
        },
        "thirdtask":(context){
          return ThirdTask(imageUrl: "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/flutter_webinar_logo.png");
        },
        "fourtask":(context){
          return FourTask();
        },
        "fifthtask":(context){
          return FifthTask();
        },
        "sixtask":(context){
          return SixTask();
        },
        "seventask":(context){
          return SevenTask();
        },
        "eigthtask":(context){
          return EigthTask();
        },
        "ninetask":(context){
          return NineTask();
        },
        "tentask":(context){
          return TenTask();
        },
      },
    ),
  );
}