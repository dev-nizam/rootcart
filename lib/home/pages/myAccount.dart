import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
   MyAccount({Key? key}) : super(key: key);
  final images = [
    "assets/MyAccount/User-Profile-PNG-File.png",
    "assets/MyAccount/pngtree-vector-wallet-icon-png-image_1025642.jpg",
    "assets/MyAccount/png-transparent-computer-icons-purchase-order-order-fulfillment-purchasing-order-icon-blue-angle-text-thumbnail.png",
    "assets/MyAccount/bank-icon-19.png",
    "assets/MyAccount/png-clipart-financial-transaction-computer-icons-money-service-user-passport-service-loan.png",
    "assets/MyAccount/images.png",
  ];
  final Caption = [
    "Profile",
    "Wallet",
    "Order",
    "Bank Details",
    "Transaction",
    "Logout",
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
              itemCount:images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10), itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width:  MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage(images[index]),fit: BoxFit.fill
                      ),
                    ),

                  ),
                  Text(Caption[index]),
                ],
              );
            },



            ),
          )),
        ],
      ),
    );
  }
}