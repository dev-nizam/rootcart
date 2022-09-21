import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
   Category({Key? key}) : super(key: key);
  final myImageAndCaption = [
    "https://www.istockphoto.com/photos/mobile-phone",
    "https://www.istockphoto.com/photos/mobile-phone",
    "https://www.istockphoto.com/photos/mobile-phone",
    "https://www.istockphoto.com/photos/mobile-phone",
    "https://www.istockphoto.com/photos/mobile-phone",
  ];
   final Caption = [
     "caption1",
     "caption2",
     "caption3",
     "caption4",
     "caption5",
   ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(child:  GestureDetector(
            onTap: (){},
            child: GridView.builder(
              itemCount:myImageAndCaption.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 5), itemBuilder: (BuildContext context, int index) {
                return CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(myImageAndCaption[index]),
                );
            },



            ),
          )),
        ],
      ),
    );
  }
}