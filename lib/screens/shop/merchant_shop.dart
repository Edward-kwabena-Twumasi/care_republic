import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/orientation/shop_category_page.dart';
import 'package:thecut/screens/shop/product_info.dart';
import 'package:thecut/screens/shop/salon_shop.dart';
import 'package:thecut/theme/custom_theme.dart';

//initializations
List products = [
  {
    "img": "https://picsum.photos/id/3/200/200",
    "name": "Pomage",
    "id": "shp1",
    "price": "20",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/4/200/200",
    "name": "Spray",
    "id": "shp1",
    "price": "30",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/46/200/200",
    "name": "Lotions",
    "id": "shp1",
    "price": "40",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/20/200/200",
    "name": "Cleansers",
    "id": "shp1",
    "price": "25",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/7/200/200",
    "name": "Wiper",
    "id": "shp1",
    "price": "45",
    "rating": "3",
  },
  {
    "img": "https://picsum.photos/id/21/200/200",
    "name": "Deodorant",
    "id": "shp1",
    "price": "16",
    "rating": "4",
  }
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
    return SafeArea(
      child: NestedScrollView(
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
                  height: size.ch(35),
                  width: size.cw(100),

                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 2,
                        sigmaY: 4
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black26
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         SizedBox(
                           height: size.ch(7),
                         ),
                          Center(
                            child: Padding(
                                padding: EdgeInsets.all(size.ch(2)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:4.0),
                                        child: SearchBar(size: size),
                                      ),
                                    ),
                                    //filter icon
                                    CustomIconButton(size: size,icon: FontAwesomeIcons.cartPlus,onPressed: (){})
                                  ],
                                )),
                          ),
                          Spacer(),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: AboutButton(),
                         )

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
            SizedBox(height: size.ch(10)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text('Product categories',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ),
            SizedBox(
              height: size.ch(17),
              child: ListView.builder(
                itemCount: shops.length,
                scrollDirection: Axis.horizontal, itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:  EdgeInsets.all(size.ch(1)),
                  child: CategoryCard(category: shops[index],imgdim:size.ch(12)),
                );
              },
                  /*shrinkWrap: true,*/

            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Picks for you',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize:20)),
                ),
                TextButton(
                    onPressed: () {
                      showMore(context, size);
                    },
                    child: Text(
                      'More',
                      style: TextStyle(
                          color: Color(0xffff9000),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),

            Expanded(
              child:
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 1,
                     // crossAxisSpacing: 2,
                      childAspectRatio:2/3,
                      mainAxisExtent: size.ch(42),
                      maxCrossAxisExtent: size.ch(40)
                  ),
                  itemBuilder: (itemBuilder, idx) {
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (productinfo)=>ProductInfo(product: products[idx])));
                          },
                          child: ItemCard(size: size, context: context, product: products[idx], id: idx.toString())),
                    );
                  }),


            ),
          ]),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Sizer size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.size, required this.icon, required this.onPressed,
  }) : super(key: key);

  final Sizer size;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
            child: Icon(icon,color: Colors.white,),
          ),
        ),
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
            //
            // BoxShadow(
            //   // blurRadius: 1.0,
            //   // spreadRadius: 0.2,
            //   // color: Colors.black12.withOpacity(0.1),
            //
            // )
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
class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.size,
    required this.context,
    required this.product, required this.id,
  }) : super(key: key);

  final Sizer size;
  final BuildContext context;
  final Map<String, dynamic> product;
  final String id;

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
                Hero(
                  tag: "prodImg"+id,
              child: Container(
                  height: size.ch(23),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(

                          image: NetworkImage(product["img"]), fit: BoxFit.cover,
                        filterQuality: FilterQuality.high

                      ))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product["name"],style:TextStyle(fontWeight: FontWeight.bold)),
                 Padding(
                   padding: const EdgeInsets.all(3.0),
                   child: Text(product["price"]),
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

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key,required this.category, required this.imgdim}) : super(key: key);
  final double imgdim;
  final Map<String,dynamic> category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: imgdim,
            height: imgdim,
            decoration:BoxDecoration(
              image: DecorationImage(image: NetworkImage(category["img"]),fit:BoxFit.cover),
              borderRadius: BorderRadius.circular(10)
            )
          ),
          Text(category["name"],style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

class AboutButton extends StatelessWidget {
  const AboutButton({
    Key? key
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        //surfaceTintColor: Colors.white,
        filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
          decoration: BoxDecoration(

              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15)
          ),
          child: Text("About",style: TextStyle(color: Colors.white),),
        ),
      ));
  }
}
//More products screen using bottomsheet
showMore(BuildContext context,Sizer size){
  showBottomSheet(
      enableDrag: false,
      context: context, builder: (build){
    return FractionallySizedBox(
     heightFactor: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.black54,
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(2),

              child: Row(
                children: [
                  CustomIconButton(size: size, icon: Icons.arrow_back,onPressed: (){
                    Navigator.pop(context);
                  }),
                  Expanded(child:
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                    child: SearchBar(size: size),
                  )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: CustomIconButton(size: size,icon: FontAwesomeIcons.cartPlus,onPressed: (){}),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.ch(8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: shops.length,
                itemBuilder: (context,index)=>Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FilterCategory(size: size, name: shops[index]["name"]),
                )),
          ),
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: shops.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 1,
                     // crossAxisSpacing: 4,
                      childAspectRatio:2/3,
                      mainAxisExtent: size.ch(42),
                      maxCrossAxisExtent: size.ch(40)
                  ),
                  itemBuilder: (itemBuilder, idx) {
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: (){},
                          child: ItemCard(size: size, context: context, product: products[idx], id: idx.toString())),
                    );
                  }),
            ),


          )
        ],
      ),
    );
  });
}

