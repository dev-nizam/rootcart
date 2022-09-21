import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rootcart/home/pages/category.dart';
import 'package:rootcart/home/pages/home.dart';
import 'package:rootcart/home/pages/myAccount.dart';
import 'package:rootcart/widgets/drower.dart';



PageController pageController = PageController(initialPage: 0);

class Nibuyhome extends StatefulWidget {
  Nibuyhome({Key? key}) : super(key: key);

  @override
  State<Nibuyhome> createState() => _NibuyhomeState();
}

class _NibuyhomeState extends State<Nibuyhome> {
  int currentIndex=0;
final List page=[
  HomePage(),
  Category(),
  MyAccount(),
];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex:currentIndex,

          backgroundColor:Colors.white ,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label:"Home",backgroundColor: Colors.blueAccent  ),
            BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "category",backgroundColor: Colors.blueAccent ),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance),label: "MyAccount",backgroundColor: Colors.blueAccent  ),


          ], onTap: (index){
        //  pageController.animateToPage(index, duration: Duration(milliseconds: 5), curve: Curves.ease);
          setState((){
            currentIndex=index;

          });


        },

        ),
        drawer:  Drawer(

            child:Drawerlis()
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          title: Text("Icart"),
          actions: [
           Container (margin: EdgeInsets.all(5),
              child:
              IconButton( onPressed: () {  }, icon: Icon(FontAwesomeIcons.wallet,)),),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("0.0",style: TextStyle(fontSize: 16),),
              ),
              IconButton( onPressed: () {  }, icon: Icon(FontAwesomeIcons.shoppingBag,)),

          ],


        ),
        body:page[currentIndex],


    );
  }
}