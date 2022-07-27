import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thecut/screens/shop/service_category_page.dart';
import 'package:thecut/theme/custom_theme.dart';

import '../../scaling/scaler.dart';
import 'search_style.dart';
List shopSpecialists = [
  {
    "img": "https://picsum.photos/id/3/200/200",
    "name": "John",
    "id": "b1"
  },
  {
    "img": "https://picsum.photos/id/5/200/200",
    "name": "Jaden",
    "id": "b2"
  },
  {
    "img": "https://picsum.photos/id/7/200/200",
    "name": "Haruna",
    "id": "b3"
  }
];
List serviceStyles = [
  {
    "img": "https://picsum.photos/id/3/200/200",
    "name": "Undercut",
    "id": "h1",
    "price": "15",
    "duration": "30"
  },
  {
    "img": "https://picsum.photos/id/5/200/200",
    "name": "Quiff",
    "id": "h2",
    "price": "15",
    "duration": "30"
  },
  {
    "img": "https://picsum.photos/id/7/200/200",
    "name": "Crew Cut",
    "id": "h3",
    "price": "15",
    "duration": "45"
  },
  {
    "img": "https://picsum.photos/id/9/200/200",
    "name": "Regular Cut",
    "id": "h4",
    "price": "18",
    "duration": "30"
  },
  {
    "img": "https://picsum.photos/id/11/200/200",
    "name": "Crew Cut",
    "id": "h5",
    "price": "20",
    "duration": "30"
  }
];


class MakeupShopInfo extends StatefulWidget {
  const MakeupShopInfo({Key? key}) : super(key: key);

  @override
  State<MakeupShopInfo> createState() => _MakeupShopInfoState();
}

class _MakeupShopInfoState extends State<MakeupShopInfo> {
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
    Sizer size = Sizer(context: context, hasBottomNav: true, hasAppBar: false);

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
                    backgroundColor: colorScheme.primary,
                    automaticallyImplyLeading: true,
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
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
                          // horizontalTitleGap: 2,
                          minVerticalPadding: 0,
                          contentPadding: EdgeInsets.only(left: 1),
                          title: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Make up shop",
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      //color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  width: size.cw(20),
                                  height: size.cw(9),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                      color: colorScheme.secondary),
                                  child: Center(
                                    child: Text("Open",
                                        style: TextStyle(
                                            color: Colors.white)),
                                  ))
                            ],
                          ),

                          subtitle: Align(
                            alignment: Alignment.centerLeft,
                            child: Chip(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              labelPadding: EdgeInsets.zero,
                              avatar: Icon(Icons.place,
                                  color: colorScheme.secondary),
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
                    height: size.ch(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
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
                        ),
                        ActionMenu(
                          icon: Icons.share,
                          label: "share",
                        )
                      ],
                    ),
                  ),
                  ListTile(
                      contentPadding: EdgeInsets.only(left: 5),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Our specialists",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      subtitle: Container(
                        padding: EdgeInsets.zero,
                        height: size.cw(24),
                        child: ListView.builder(
                          itemCount: shopSpecialists.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=>Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ShopSpecialist(size: size,data:shopSpecialists[index]),
                          ),

                        ),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Builder(builder: (context) {
                        return ShopTabs(
                          context: context,
                          size: size,
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
            backgroundColor: colorScheme.secondary.withOpacity(0.2),
            radius: 19,
            child: Icon(
              icon,
              size: 18,
              color: colorScheme.secondary,
            )),
        Text(label)
      ],
    );
  }
}
//shop specialists card
class ShopSpecialist extends StatelessWidget {
  const ShopSpecialist({Key? key, required this.size, required this.data}) : super(key: key);
  final Sizer size;
  final Map<String,dynamic> data;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CircleAvatar(
          radius: size.cw(8),
          backgroundImage: NetworkImage(data["img"]),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text("John"),
        )
      ],
    );
  }
}


//Shop tab navigation
class ShopTabs extends StatefulWidget {
  const ShopTabs({Key? key, required this.context, required this.size}) : super(key: key);
  final BuildContext context;
  final Sizer size;
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Our Services",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (builder){
                                return ServiceCatetegoryPage(category: "Haircut");
                              }));
                            },
                            child: Text("See all"))
                      ],
                    ),
                  ),
                  Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (builder){
                          return ServiceCatetegoryPage(category: "Haircut");
                        }));
                      },
                      enabled: true,
                      title: Text("Hair Cut"),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder){
                              return ServiceCatetegoryPage(category: "Haircut");
                            }));
                          },
                          icon: Icon(Icons.arrow_forward_ios)),
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
