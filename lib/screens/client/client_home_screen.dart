import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/client/category_page.dart';
import 'package:thecut/screens/shop/about_shop.dart';
import 'package:thecut/screens/shop/salon_info.dart';
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

final List<String> imgList = [
  'assets/announcement_1.png',
  'assets/announcement_2.png'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 1000.0,
                      imageUrl: item,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
List filterNames = ["All"];

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({Key? key}) : super(key: key);

  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
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
                pinned: true,
                backgroundColor: colorScheme.primary,
                leading: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
                title: Text(
                  'theCut',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    onPressed: () {},
                  )
                ],
                expandedHeight: size.ch(35) + 70,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.only(
                        bottom: size.ch(0.3), top: size.ch(1) + 40),
                    height: size.ch(25),
                    width: size.cw(96),
                    /* width: MediaQuery.of(context).size.width,*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                             Padding(
                               padding: const EdgeInsets.only(left:8.0),
                               child: Text(
                                    "Welcome to theCut 😍",
                                    /*${'Aliko'}*/
                                    style: TextStyle(
                                        fontSize: 20.sp, fontWeight: FontWeight.bold,color: Colors.white),
                                  ),
                             ),
                        Center(
                          child: Padding(
                              padding: EdgeInsets.all(size.ch(1)),
                              child: Card(
                                //surfaceTintColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                elevation: 20,
                                semanticContainer: false,
                                borderOnForeground: false,
                               // shadowColor: Colors.transparent,
                                color: Colors.transparent,
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                   color: Colors.white10,
                                   borderRadius: BorderRadius.circular(10) 
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
                              )),
                        ),
                        Center(
                          child: CarouselSlider(
                            carouselController: _controller,
                            options: CarouselOptions(
                                height: size.ch(25),
                                viewportFraction: 1.2,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                            items: imgList
                                .map((item) => ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(item,
                                        fit: BoxFit.cover, width: size.cw(96))))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: size.ch(11)),

        Container(
          height: size.ch(13),
          child: Padding(
            padding: EdgeInsets.all(size.cw(0.2)),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MajorCategory(
                  size: size,
                  name: 'Trim',
                  icon: Icons.cut,
                ),
                MajorCategory(
                  size: size,
                  name: 'Makeup',
                  icon: Icons.color_lens,
                ),
                MajorCategory(
                  size: size,
                  name: 'Retouch',
                  icon: Icons.touch_app,
                ),
                MajorCategory(
                  size: size,
                  name: 'Wash',
                  icon: Icons.wash,
                ),
                MajorCategory(
                  size: size,
                  name: 'Extension',
                  icon: Icons.extension,
                ),
                MajorCategory(
                  size: size,
                  name: 'Dying',
                  icon: Icons.colorize
                ),
                
                MajorCategory(
                  size: size,
                  name: 'Afro',
                  icon: FontAwesomeIcons.houseDamage,
                ),
                MajorCategory(
                  size: size,
                  name: 'Perfume',
                  icon: FontAwesomeIcons.sprayCan,
                ),
              ],
            ),
          ),
        ),
        //filters
        Padding(
          padding: EdgeInsets.all(size.ch(1)),
          child: SizedBox(
            height: size.ch(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Nearby Your Location',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
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
          child: ListView.builder(
              shrinkWrap: true,
              // scrollDirection:Axis.horizontal,
              itemCount: shops.length,
              itemBuilder: ((context, index) =>
                  ShopCard(size: size, context: context, shop: shops[index]))),
        ),
      ]),
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.size.cw(1.2), vertical: widget.size.cw(0.2)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
              primary: filterNames.contains(widget.name)
                  ? colorScheme.secondary
                  : colorScheme.onSecondary,
              side: BorderSide(color: colorScheme.secondary)),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
          width: size.cw(90),
          height: size.cw(35),
          child: Row(children: [
            Padding(
              padding:  EdgeInsets.all(size.cw(2)),
              child: Container(
                  height: size.cw(30),
                  width: size.cw(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15
                    ),
                      image: DecorationImage(
                        
                          image: NetworkImage(shop["img"]), fit: BoxFit.cover))),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SalonInfo())));
                      },
                      title: Text(shop["name"]),
                      subtitle: Text(shop["location"]),
                    ),
                  ),
                  Align(
                    
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      padding: EdgeInsets.only(left: 8),
                      labelPadding: EdgeInsets.zero,
                      labelStyle: TextStyle(fontSize: 20.sp,color: colorScheme.primary),
                      backgroundColor: Colors.transparent,
                      label: Text(shop["rating"]),
                      avatar: Icon(Icons.star,color: colorScheme.secondary.withOpacity(0.6),),
                    ),
                  )
                ],
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
