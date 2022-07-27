import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShopDrawer extends StatefulWidget {
  const ShopDrawer({Key? key}) : super(key: key);

  @override
  _ShopDrawerState createState() => _ShopDrawerState();
}

class _ShopDrawerState extends State<ShopDrawer> {

  List<Map<String,dynamic>> accountProfiles=[

    { "name":"Salon",
      "active":true
    },
    { "name":"Merchant",
      "active":false
    },
    { "name":"Makeup",
      "active":false
    }
  ];
  @override
  initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        //color:Colors.black26,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                width:double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.blueGrey
                  //image: DecorationImage(image: image)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("created living"),
                      subtitle: Text("createdliving1000@gmail.com"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              buildMenuItem(
                  text: 'My Specialists',
                  icon: Icons.people,
                  onClicked: () {

                  }),
              buildMenuItem(
                  text: 'Money',
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

              Divider(
                thickness: 4,
              ),

              Padding (
                padding: const EdgeInsets.all(15.0),
                child: Text("Profiles",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ),
              ...accountProfiles.map((profile) =>
                  Profile(profile: profile,onClicked: (){
                    setState((){
                     accountProfiles.forEach((profile) =>profile["active"]=false );
                     profile["active"]=!profile["active"];
                    });

                      showDialog(context: context, builder: (build){
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Switching accound ...")
                            ],
                          ),
                        );
                      }).then((value) {
                        Future.delayed(Duration(microseconds: 100), () {
                          Navigator.pop(context);
                        });
                      });


                  })),




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
      ),
    );
  }

  

  buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.black;
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


class Profile extends StatefulWidget {
  const Profile({Key? key, this.onClicked, required this.profile}) : super(key: key);
 final VoidCallback? onClicked;
 final Map<String,dynamic> profile;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(

      onTap: widget.onClicked,

      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 7),
        child: Card(
          elevation: 0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[Text(widget.profile["name"],style: TextStyle(color: Colors.black),),
                Checkbox(value: widget.profile["active"], onChanged: (bool? newValue) {
                 setState((){
                   widget.profile["active"]=newValue;
                 });
                },)
              ]),
        ),
      ),
    );
  }
}


