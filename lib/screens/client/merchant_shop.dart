import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/client/shop_category_page.dart';
import 'package:thecut/screens/shop/shop_information_page.dart';
import 'package:thecut/theme/custom_theme.dart';

//initializations
List shops = [
  {
    "img": "https://picsum.photos/id/3/200/200",
    "name": "Vivians shop",
    "id": "shp1",
    "location": "Location 1",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/4/200/200",
    "name": "Vivians shop",
    "id": "shp1",
    "location": "Location 1",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/46/200/200",
    "name": "Vivians shop",
    "id": "shp1",
    "location": "Location 1",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/20/200/200",
    "name": "Vivians shop",
    "id": "shp1",
    "location": "Location 1",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/7/200/200",
    "name": "Vivians shop",
    "id": "shp1",
    "location": "Location 1",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/21/200/200",
    "name": "Vivians shop",
    "id": "shp1",
    "location": "Location 1",
    "rating": "4",
  },
  {
    "img": "https://picsum.photos/id/70/200/200",
    "name": "Vivians shop",
    "id": "shp1",
    "location": "Location 1",
    "rating": "3",
  },
];

List filterNames = ["All"];

class MerchantShopInfo extends StatefulWidget {
  const MerchantShopInfo({Key? key}) : super(key: key);

  @override
  _MerchantShopInfoState createState() => _MerchantShopInfoState();
}

class _MerchantShopInfoState extends State<MerchantShopInfo> {
  late bool isLoading = true;
  late PageController controller;
  ScrollController scrollController = ScrollController();
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 1);
    scrollController.addListener(() {
      print(scrollController.offset.toString()+" is Current offser");
    });
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasBottomNav: true, hasAppBar: false);
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: ((context, innerBoxIsScrolled) => [
        SliverOverlapAbsorber(
          // This widget takes the overlapping behavior of the SliverAppBar,
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            automaticallyImplyLeading: true,
            pinned: true,
            backgroundColor: colorScheme.primary,
            
            title: Text(
              'Kojo Cosmetic Shop',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
              IconButton(
                icon: Icon(Icons.bookmark),
                onPressed: () {},
              )
            ],
            expandedHeight: size.ch(35) ,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/client_home_background.jpg"),fit: BoxFit.cover)
                ),
                // padding: EdgeInsets.only(
                //     bottom: size.ch(0.3), top:  40),
                height: size.ch(35),
                width: size.cw(100),
                /* width: MediaQuery.of(context).size.width,*/
                //Create parent backdrop filter
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black26
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       SizedBox(
                         height: size.ch(12),
                       ),
                        Center(
                          child: Padding(
                              padding: EdgeInsets.all(size.ch(1)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right:4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 15,
                                                  spreadRadius: 15,
                                                  color: Colors.black12
                                              )
                                            ]
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: BackdropFilter(
                                            //surfaceTintColor: Colors.white,

                                            filter: ImageFilter.blur(
                                                sigmaX: 10,
                                                sigmaY: 10
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(size.ch(2)),
                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.4),
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Search",
                                                    /*${'Aliko'}*/
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                  // Text("Search",style: TextStyle(color: Colors.white),),
                                                  Icon(Icons.search_outlined,color: Colors.white,)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //filter icon
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 15,
                                                spreadRadius: 15,
                                                color: Colors.black12
                                            )
                                          ]
                                      ),
                                      child: BackdropFilter(
                                        //surfaceTintColor: Colors.white,
                                        filter: ImageFilter.blur(
                                            sigmaX: 10,
                                            sigmaY: 10
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(size.ch(2)),
                                          decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.4),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Icon(Icons.filter_alt_outlined,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      body: Material(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: size.ch(11)),


          Padding(
            padding: EdgeInsets.all(size.ch(2)),
            child: SizedBox(
              height: size.ch(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Products for you',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'More',
                        style: TextStyle(
                            color: Color(0xffff9000),
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.cw(1)),
            child: SizedBox(
              height: size.ch(8),
              child: ListView(scrollDirection: Axis.horizontal,
                  /*shrinkWrap: true,*/
                  children: [
                    FilterCategory(size: size, name: 'All'),
                    FilterCategory(size: size, name: 'Haircut'),
                    FilterCategory(size: size, name: 'Makeup'),
                    FilterCategory(size: size, name: 'Manicure'),
                    FilterCategory(size: size, name: 'Pedicure'),
                    FilterCategory(size: size, name: 'Trim'),
                  ]),
            ),
          ),
          Expanded(
            child:
            GridView.builder(
                itemCount: shops.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2 / 3,
                    //mainAxisExtent: 100,
                    maxCrossAxisExtent: 200
                ),
                itemBuilder: (itemBuilder, idx) {
                  return  ShopCard(size: size, context: context, shop: shops[idx]);
                }),


          ),
        ]),
      ),
    );
  }
}

//Filter category widget
class FilterCategory extends StatefulWidget {
  const FilterCategory({
    Key? key,
    required this.size,
    required this.name,
  }) : super(key: key);

  final Sizer size;
  final String name;

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow:[

            BoxShadow(
              blurRadius: 1.0,
              spreadRadius: 0.2,
              color: Colors.black12.withOpacity(0.1),

            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
              primary: filterNames.contains(widget.name)
                  ? colorScheme.secondary
                  : colorScheme.onSecondary,
              //side: BorderSide(color: colorScheme.secondary)
            ),
            onPressed: () {
              setState(() {
                filterNames.contains(widget.name)
                    ? filterNames.remove(widget.name)
                    : filterNames.add(widget.name);
              });
            },
            child: Text(widget.name,
                style: TextStyle(
                    color: filterNames.contains(widget.name)
                        ? colorScheme.onSecondary
                        : colorScheme.secondary))),
      ),
    );
  }
}

//shop card widget
class ShopCard extends StatelessWidget {
  const ShopCard({
    Key? key,
    required this.size,
    required this.context,
    required this.shop,
  }) : super(key: key);

  final Sizer size;
  final BuildContext context;
  final Map<String, dynamic> shop;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
          // width: size.cw(90),
          //height: size.cw(25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Container(
                height: size.cw(25),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(

                        image: NetworkImage(shop["img"]), fit: BoxFit.cover))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shop["name"],style:TextStyle(fontWeight: FontWeight.bold)),
                 Padding(
                   padding: const EdgeInsets.all(3.0),
                   child: Text(shop["location"]),
                 ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                 Text("19.99",style:TextStyle(fontWeight: FontWeight.bold)),
                     CircleAvatar(
                       radius:15,
                       backgroundColor: Colors.black,
                       child: Center(child: IconButton(onPressed: (){},
                           icon: Icon(FontAwesomeIcons.heart,color: Colors.white,size: 14,))),
                     )
                      ],
                    )
                    //
                  ],
                ),
              ),
            )
          ])),
    );
  }
}

//Major category
class MajorCategory extends StatelessWidget {
  const MajorCategory({
    Key? key,
    required this.size,
    required this.name, required this.icon,
  }) : super(key: key);

  final Sizer size;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => CatetegoryPage(category: name)))),
      child: Padding(
        padding: EdgeInsets.all(size.cw(1)),
        child: Column(
          children: [
            CircleAvatar(
                radius: size.ch(3.4),
                child: Icon(icon,color: colorScheme.secondary,),
                backgroundColor: colorScheme.secondary.withOpacity(0.2)),
            FittedBox(
                child: Text(
                  name,
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
