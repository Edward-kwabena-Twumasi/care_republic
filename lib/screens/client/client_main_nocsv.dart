import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/shop/salon_info.dart';
import 'package:thecut/theme/custom_theme.dart';

//initializations
List shops= [
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

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({Key? key}) : super(key: key);

  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}



class _ClientHomeScreenState extends State<ClientHomeScreen> {
  late bool isLoading = true;
  late PageController controller;
    ScrollController scrollController=ScrollController();
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
    Sizer size = Sizer(context: context, hasBottomNav: true, hasAppBar: true);
    return Scaffold(
      appBar: AppBar(
                   
            backgroundColor: Color(0xffff9000),
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
          ),
      
        
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          
          SizedBox(
            height: size.ch(8),
            child: Padding(
                padding: EdgeInsets.all(size.ch(2)),
                child: Text(
                  "Welcome to theCut,😍",
                  /*${'Aliko'}*/
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.ch(2), horizontal: size.cw(2)),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0x20c9c8c8),
                  borderRadius: BorderRadius.circular(size.ch(1))),
              child: Row(
                children: [
                  IconButton(
                      splashRadius: size.cw(5),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color(0x44c9c8c8),
                      )),
                  Text(
                    'Search',
                    style: TextStyle(color: const Color(0x44c9c8c8)),
                  ),
                  Spacer(),
                  IconButton(
                    splashRadius: size.cw(5),
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Color(0xffff9000),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.cw(2), vertical: size.ch(1)),
            child: Container(
              height: size.ch(25),
              width: size.cw(96),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(size.ch(5))),
              child: LayoutBuilder(
                  builder: (BuildContext ctx, BoxConstraints constraints) {
                final double SLIDER_HEIGHT = 0.35 * constraints.maxHeight;
                final double CATEGORY_HEIGHT = 0.13 * constraints.maxHeight;
                final double POPULAR_CARD = 0.22 * constraints.maxHeight;
                final double SUGGESTION_CARDS = 0.22 * constraints.maxHeight;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //First child
                    Container(
                      height: size.ch(25),
                      width: size.cw(96),
                      /* width: MediaQuery.of(context).size.width,*/
                      child: Stack(children: [
                        CarouselSlider(
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
                      ]),
                    )
                  ],
                );
              }),
            ),
          ),
          Container(
            height: size.ch(13),
            child: Padding(
              padding: EdgeInsets.all(size.cw(0.2)),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.science),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Makeup',
                          style: TextStyle(color: Colors.black),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.science),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Trim',
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.science),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Retouch',
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.science),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Wash',
                          style: TextStyle(color: Colors.black),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.science),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Extension',
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.science),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Dying',
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.science),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Afro',
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.science),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Creams',
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.cw(1)),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: size.ch(4),
                            child: Icon(Icons.sailing),
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.2)),
                        const FittedBox(
                            child: Text(
                          'Perfume',
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
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
                    Padding(
                      padding: EdgeInsets.all(size.cw(1)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(5),
                              primary: colorScheme.secondary,
                              side: BorderSide(color: colorScheme.secondary)),
                              
                          onPressed: () {},
                          child:  Text('All',style: TextStyle(
                            color:colorScheme.onSecondary
                          ))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.cw(1)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(5),
                              primary: colorScheme.onSecondary,
                              side: BorderSide(color: colorScheme.secondary)),
                              
                          onPressed: () {},
                          child:  Text('Haircut',style: TextStyle(
                            color:colorScheme.secondary
                          ),)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.cw(1)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(5),
                              primary: colorScheme.onSecondary,
                              side: BorderSide(color: colorScheme.secondary)),
                              
                          onPressed: () {},
                          child:  Text('Makeup',style: TextStyle(
                            color:colorScheme.secondary
                          ))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.cw(1)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(5),
                              primary: colorScheme.onSecondary,
                              side: BorderSide(color: colorScheme.secondary)),
                              
                          onPressed: () {},
                          child:  Text('Manicure',style: TextStyle(
                            color:colorScheme.secondary
                          ))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.cw(1)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(5),
                              primary: colorScheme.onSecondary,
                              side: BorderSide(color: colorScheme.secondary)),
                              
                          onPressed: () {},
                          child:  Text('Pedicure',style: TextStyle(
                            color:colorScheme.secondary
                          ))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.cw(1)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(5),
                              shape: StadiumBorder(),
                              primary: colorScheme.onSecondary,
                              side: BorderSide(color: colorScheme.secondary)),
                              
                          onPressed: () {},
                          child:  Text('Trim',style: TextStyle(
                            color:colorScheme.secondary
                          ))),
                    ),
                  ]),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
              // scrollDirection:Axis.horizontal,
              itemCount: shops.length,
              itemBuilder: ((context, index) => shopCard(size, context,shops[index])))
        ]),
      ),
    );
  }

  Card shopCard(Sizer size, BuildContext context,dynamic shop) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
          width: size.cw(90),
          height:size.cw(30) ,
          child: Row(children: [
            Container(
              height: size.cw(30),
              width: size.cw(30),
              decoration: BoxDecoration(
               image:DecorationImage(image: NetworkImage(shop["img"]),fit: BoxFit.cover)
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => SalonInfo())));
                      },
                      title: Text(shop["name"]),
                      subtitle: Text(shop["location"]),
                    ),
                  ),
                 
                  Chip(label: Text(shop["rating"]),avatar: Icon(Icons.star),)
                ],
              ),
            )
          ])),
    );
  }
}
