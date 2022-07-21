import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShopDrawer extends StatefulWidget {
  const ShopDrawer({Key? key}) : super(key: key);

  @override
  _ShopDrawerState createState() => _ShopDrawerState();
}

class _ShopDrawerState extends State<ShopDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color:Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          /* crossAxisAlignment: CrossAxisAlignment.start,*/
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                    child: ListTile(


                      contentPadding: EdgeInsets.zero,
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(""),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(""),
                      ),

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            buildMenuItem(
                text: 'Profile',
                icon: Icons.person,
                onClicked: () {
                  
                }),

            buildMenuItem(
                text: 'Shop styles',
                icon: Icons.add,
                onClicked: () {
                  
                }),

            buildMenuItem(
                text: 'My Barbers',
                icon: Icons.people,
                onClicked: () {
                 
                }),
            buildMenuItem(
                text: 'Accounts',
                icon: Icons.account_balance_wallet,
                onClicked: () {
                  
                }),
            buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () {
                 
                }),
            buildMenuItem(
                text: 'Support', icon: Icons.contact_support, onClicked: () {}),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: TextButton(
                          onPressed: () {
                           
                          },
                          child: Text("Sign Out")),
                )

              ),
            )
          ],
        ),
      ),
    );
  }

  

  buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.white.withOpacity(0.64);
    return ListTile(
      leading: Icon(icon, color: color),
      onTap: onClicked,
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
