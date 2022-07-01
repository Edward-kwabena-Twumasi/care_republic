import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/shop/salon_info.dart';

import '../../theme/custom_theme.dart';

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

class CatetegoryPage extends StatefulWidget {
  const CatetegoryPage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<CatetegoryPage> createState() => _CatetegoryPageState();
}

class _CatetegoryPageState extends State<CatetegoryPage> {
  
  @override
  Widget build(BuildContext context) {
        Sizer size = Sizer(context: context, hasBottomNav: true, hasAppBar: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(widget.category),
        bottom: PreferredSize(child: 
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
                                  padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
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
         preferredSize:Size.fromHeight(70)),
      ),
      body: ListView.builder(
              shrinkWrap: true,
              // scrollDirection:Axis.horizontal,
              itemCount: shops.length,
              itemBuilder: ((context, index) =>
                  ShopCard(size: size, context: context, shop: shops[index])))
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
              padding: EdgeInsets.all(size.cw(2)),
              child: Container(
                  height: size.cw(30),
                  width: size.cw(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(shop["img"]),
                          fit: BoxFit.cover))),
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
                      labelStyle: TextStyle(
                          fontSize: 20.sp, color: colorScheme.primary),
                      backgroundColor: Colors.transparent,
                      label: Text(shop["rating"]),
                      avatar: Icon(
                        Icons.star,
                        color: colorScheme.secondary.withOpacity(0.6),
                      ),
                    ),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
