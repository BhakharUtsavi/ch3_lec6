import 'package:ch3_lec6/screen/thirdtask.dart';
import 'package:flutter/material.dart';

class Imagelist_ThirdTask extends StatefulWidget {
  const Imagelist_ThirdTask({super.key});

  @override
  State<Imagelist_ThirdTask> createState() => _Imagelist_ThirdTaskState();
}

class _Imagelist_ThirdTaskState extends State<Imagelist_ThirdTask> {

  final List<String> imageUrls = [
    'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/flutter_webinar_logo.png',
    'https://tse2.mm.bing.net/th?id=OIP.AMEH6XY-fWD_NuFsJAIN1wHaJM&pid=Api&P=0&h=180',
    'https://tse1.mm.bing.net/th?id=OIP.1fsO82H3v8pgaeGXj_c0OAHaHa&pid=Api&P=0&h=180',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(imageUrls[index], width: 50, height: 50, fit: BoxFit.cover),
            title: Text('Image ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThirdTask(
                    imageUrl: imageUrls[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
