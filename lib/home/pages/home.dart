import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rootcart/bloc/product%20view/product_bloc.dart';
import 'package:rootcart/model/ProductModel.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 late List<ProductModel> productModel;
  @override
  void initState() {
BlocProvider.of<ProductBloc>(context).add(getProduct());
    // TODO: implement initState
    super.initState();
  }
   final List Images=[
"assets/banner/8b41cb71916a783e552c296e6f3486ec.jpg",
"assets/banner/1600098931-pngtree-simple-red-shading-background-illustration-design-backgroundscience-and-technologyred-image_70514.jpg",
"assets/banner/mabile_acce.jpg",
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : BlocBuilder<ProductBloc,ProductState>(builder: (context,state) {
        if (state is ProductLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoaded) {
          productModel = BlocProvider
              .of<ProductBloc>(context)
              .productModel;
          return  SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 30,
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    // obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder:  OutlineInputBorder(),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),),
                        labelText: 'Search',
                        suffixIcon: Icon(Icons.keyboard_voice_outlined,
                            color: Colors.red),
                        prefixIcon: Icon(
                          Icons.search_off,
                          color: Colors.black,
                        )),),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height*0.25,
                  color: Colors.purple,
                  child: PageView.builder(
                    itemCount: Images.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Images[index]),
                                  fit: BoxFit.fill)));
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Text("Trend of the week"),
                Container(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:productModel.length,
                      itemBuilder: (BuildContext ctx,int index){
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Homefullpage()));
                                },
                                child: Container(

                                  height: MediaQuery.of(context).size.height * .15,
                                  width: 100,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage("https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2022/05/iPhone14-1-photoutils.com_.jpeg?fit=1280%2C850&ssl=1"),fit: BoxFit.fill
                                    ),
                                  ),

                                ),
                              ),
                            ), Column(
                              children: [
                                Text(productModel[index].productName.toString()),
                                Text("₹${productModel[index].price.toString()}"),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
                SizedBox(height: 10,),
                Text("best offers"),
                Container(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext ctx,int index){
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Homefullpage()));
                                },
                                child: Container(

                                  height: MediaQuery.of(context).size.height * .15,
                                  width: 100,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage("https://www.reliancedigital.in/medias/Reconnect-Powerbank-10000mAh-RAPBB1007Red-491503492-i-1-1200Wx1200H?context=bWFzdGVyfGltYWdlc3wyMzQ1Njh8aW1hZ2UvanBlZ3xpbWFnZXMvaGUwL2hkZC85MTcxMjA0NDA3MzI2LmpwZ3xkMzBlYTcyNTc2ZmVkYzUyMzQ4YTNlZmUyZWZjZDkxNTZiODFkZWRiNjg3ZGZjMDdiZTM3ZGRiNTA1ZGYzYWI3"),fit: BoxFit.fill
                                    ),
                                  ),

                                ),
                              ),
                            ), Column(
                              children: [
                                Text("name"),
                                Text("₹${20}"),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          );
        }if(state is ProductError){
          return Center(
            child: Text("something went wrong "),
          );

        }return Container();

      })

    );
  }
}