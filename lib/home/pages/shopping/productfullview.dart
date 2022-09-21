import 'package:flutter/material.dart';


class ProductFullView extends StatefulWidget {
  ProductFullView({Key? key}) : super(key: key);

  @override
  State<ProductFullView> createState() => _ProductFullViewState();
}

class _ProductFullViewState extends State<ProductFullView> {
  final List Images = [
    "asset/productmg/red.jpg",
    "asset/productmg/green.jpg",
    "asset/productmg/download.png",
  ];

  final List wColors=[
    "red",
    "green",
    "Black",
  ];

  final List Price=[
    "3000",
    "4000",
    "5000",
  ];

  late String proImg = Images[0];

  late String proPrice = Price[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //shrinkWrap: true,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .4,
                child: PageView.builder(
                  itemCount: Images.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage(proImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "Product name",
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "₹${proPrice}",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "quantity",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (Ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    proImg = Images[index];
                                    proPrice = Price[index];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      wColors[index],
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.all(50),
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ADD TO CART"),
                                CircleAvatar(
                                  backgroundColor:Colors.white,
                                  radius: 20,
                                  child: Icon(Icons.shopping_cart),
                                ),
                              ],),
                          ),

                        ),
                      ),
                      Text("You May Be intrested In"),
                      SizedBox(
                        height: 5,
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
