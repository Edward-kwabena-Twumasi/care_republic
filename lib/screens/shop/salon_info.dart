
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'choose_service.dart';

class SalonInfo extends StatefulWidget {
  const SalonInfo({Key? key}) : super(key: key);

  @override
  State<SalonInfo> createState() => _SalonInfoState();
}

class _SalonInfoState extends State<SalonInfo> {
  late ScrollController scrollController;
  String offset = "0";
  int offsetval = 140;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 1);
    scrollController.addListener(() {
      setState(() {
        offset = scrollController.offset.toString().split(".")[0];
        offsetval = int.parse(offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            // scrollBehavior:ScrollBehavior() ,
            controller: scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              // These are the slivers that show up in the "outer" scroll view.
              return <Widget>[
                SliverOverlapAbsorber(
                  // This widget takes the overlapping behavior of the SliverAppBar,
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.grey,
                    automaticallyImplyLeading: true,
                    leading: IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.arrowLeft)),
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.bookmark))
                    ],
                    title: Text(
                      offsetval > 140 ? "Vivians Shop " : "",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/manshaving.jpg"),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            //First child-container with image

            //Second child-container containing a column for top children
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  offsetval > 140
                      ? Text("")
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              //shop title and open button row
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "Vivians shop",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.amber),
                                    child: Text("Open",
                                        style: TextStyle(color: Colors.white))),
                                subtitle: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Chip(
                                    padding: EdgeInsets.zero,
                                    avatar:
                                        Icon(Icons.place, color: Colors.amber),
                                    label: Text(
                                      "AH-0985-1234,Ayigya",
                                      style: TextStyle(),
                                    ),
                                  ),
                                ),
                              ),
                              //shop location row
                            ],
                          ),
                        ),
                  Container(
                    padding: EdgeInsets.zero,
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ActionMenu(
                          label: "Phone",
                          icon: Icons.phone,
                        ),
                        ActionMenu(
                          label: "Message",
                          icon: FontAwesomeIcons.facebookMessenger,
                        ),
                        ActionMenu(
                          label: "Direction",
                          icon: Icons.directions,
                        ),
                        ActionMenu(
                          icon: Icons.share,
                          label: "share",
                        )
                      ],
                    ),
                  ),
                  Text("Our specialists"),
                  Container(
                    padding: EdgeInsets.zero,
                    height: 85,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ShopSpecialist(),
                        ShopSpecialist(),
                        ShopSpecialist(),
                        ShopSpecialist()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Builder(builder: (context) {
                        return ShopTabs(
                          context: context,
                        );
                      }),
                    ),
                  )
                ])),
      ),
    );
  }
}

//Shop home action menus
class ActionMenu extends StatelessWidget {
  const ActionMenu({Key? key, required this.label, required this.icon})
      : super(key: key);
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: Colors.amberAccent.withOpacity(0.2),
            radius: 19,
            child: Icon(
              icon,
              size: 18,
              color: Colors.amber,
            )),
        Text(label)
      ],
    );
  }
}

class ShopSpecialist extends StatelessWidget {
  const ShopSpecialist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     height: 40,
     child: Card(
       child: Column(
         children: [
           Text("Specialis")
         ],
       ),
     ));
  }
}
//shop specialists card

//Shop tab navigation
class ShopTabs extends StatefulWidget {
  const ShopTabs({Key? key, required this.context}) : super(key: key);
  final BuildContext context;
  @override
  State<ShopTabs> createState() => _ShopTabsState();
}

class _ShopTabsState extends State<ShopTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  List gallery = ["barbclip.jpg", "barbershop.jpg", "beard.png", "dye.png"];
  static const List<Tab> tabs = <Tab>[
    Tab(
      child: Text(
        "About Us",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      //style: TextStyle(),
    ),
    Tab(
      child: Text(
        "Services",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      //style: TextStyle(),
    ),
    Tab(
      child: Text(
        "Gallery",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // style: TextStyle(),
    ),
    Tab(
      child: Text(
        "Reviews",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      //style: TextStyle(),
    )
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //backgroundColor: Colors.grey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: TabBar(
            controller: _tabController,
            onTap: (index) {
              _tabController.animateTo(index);
              setState(() {
                _selectedIndex = index;
              });
            },
            //unselectedLabelStyle: TextStyle(color: Colors.amber),
            labelStyle: TextStyle(color: Colors.black),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Colors.amber,
            ),
            isScrollable: true,
            tabs: [...tabs.map((tab) => tab).toList()],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                        "This is Salomays salon. We specialise in different ladies hair styles and dos. If you want to look good at an affordable rate"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("Working hours",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 13),
                          children: [
                        TextSpan(text: "Mon - Fri "),
                        TextSpan(
                            text: "10 am - 21 pm ",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ])),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("Contact Us",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Text("0552489602", style: TextStyle()),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("Locate Us",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  // ignore: prefer_const_constructors
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.place, color: Colors.amber),
                      Text(
                        "AH-0985-1234,Ayigya",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              //physics: ClampingScrollPhysics(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Our Services",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      onTap: () {
                        showSearch(
                            context: context,
                            delegate: ChooseService("Hair cut"));
                      },
                      enabled: true,
                      title: Text("Hair Cut"),
                      trailing: TextButton(
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: ChooseService("Hair cut"));
                          },
                          child: Text("See all")),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
                itemCount: gallery.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2 / 3,
                    mainAxisExtent: 100,
                    maxCrossAxisExtent: 150),
                itemBuilder: (itemBuilder, idx) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(50),
                        ),
                    elevation: 1,
                    child: Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('images/${gallery[idx]}'),
                              fit: BoxFit.cover)),
                    ),
                  );
                }),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Customer reviews",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  CustomerReview(),
                  CustomerReview()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Review card

class CustomerReview extends StatelessWidget {
  const CustomerReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/manshaving.jpg"),
              ),
              title: Text(
                "Jeson jics",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Chip(label: Text("3"), avatar: Icon(Icons.star)),
            ),
            Text(
                "I really enjoyed my time at your salon. I will alwats patronize your services now"),
            Chip(
                label: Text("3"),
                avatar: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 18,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
