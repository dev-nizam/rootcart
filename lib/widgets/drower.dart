
import 'package:flutter/material.dart';


class Drawerlis extends StatelessWidget {
  const Drawerlis({Key? key}) : super(key: key);
  Widget Drawerlist({
    required IconData listicon,
    required String listtext

  }){return ListTile(
    leading: Icon(
      listicon,
      color: Colors.black,
    ),
    title:  Text(listtext),
    onTap: () {
// Update the state of the app
// ...
// Then close the drawer
      Navigator.pop;
    },
  );

  }
  @override
  Widget build(BuildContext context) {
    return
      ListView(
        // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Icart'),
            ),
            ListTile(
              leading: Icon(
                Icons.account_box_outlined,
                color: Colors.black,
              ),
              title: const Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Drawerlist(listicon: (Icons.search), listtext: "Search"),
            Drawerlist(listicon: (Icons.border_color_rounded), listtext: "My ORder"),
            Drawerlist(listicon: (Icons.share_outlined), listtext: "Invite Friends"),
            Drawerlist(listicon: (Icons.star), listtext: "Rate App"),
            Drawerlist(listicon: (Icons.settings), listtext: "Settings"),
            Drawerlist(listicon: (Icons.live_help_outlined), listtext: "Help"),
            Drawerlist(listicon: (Icons.policy), listtext: "Policy"),
          ]);
  }
}