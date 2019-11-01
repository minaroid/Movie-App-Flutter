import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'MyCustomProgress.dart';

class SwiperScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwiperState();
  }
}

class SwiperState extends State<SwiperScreen> {
  var images = [
    "https://www.lawliberty.org/wp-content/uploads/2017/12/AdobeStock_105994137-1024x680.jpeg",
    "https://images.unsplash.com/photo-1420593248178-d88870618ca0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80",
    "https://images.unsplash.com/photo-1420593248178-d88870618ca0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80",
    "https://images.unsplash.com/photo-1420593248178-d88870618ca0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80",
    "https://images.unsplash.com/photo-1416169607655-0c2b3ce2e1cc?ixlib=rb-1.2.1&auto=format&fit=crop&w=2467&q=80"
  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          print(index.toString());

//          if(index ==2)
//            pr.show();
//            else pr.hide();
//
          return Text("dddd");
        },
        itemCount: 5,
        pagination: SwiperPagination(),
      ),
    );
  }
}
