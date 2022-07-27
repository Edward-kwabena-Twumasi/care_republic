import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
List<Map<String,dynamic>> cart = [
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

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


        return SafeArea(
          child: Scaffold(
            
              body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  //Spacer(),
                  Text("Cart",style: TextStyle(fontSize: 23),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Total "),
                        Text("70",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: Cart_List()),
            ],
          )),
        );

  }
 }

 class Cart_List extends StatefulWidget {
  const Cart_List({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart_List> createState() => _Cart_ListState();
}

class _Cart_ListState extends State<Cart_List>  {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List<Widget> cartItems=[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      for (var item=0;item<cart.length;  item++) {
       // print(cart[item]);

        cartItems.add(CartItem(item:cart[item],delete: (){
          //print(cart[item]);
          setState((){
            cart.removeAt(item);
            cartItems.removeAt(item);
          });

          print(cartItems);
          _listKey.currentState?.removeItem(item,(context,animation){
            return CartItem(item: cart[item], delete: (){});
          });
        }));
        _listKey.currentState?.insertItem(item,duration: Duration(milliseconds:item*100));
      }

    });
  }
  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      padding: EdgeInsets.all(5),
      key: _listKey,
        initialItemCount: cartItems.length,
        itemBuilder: (context,idx,animation){
       return
         SlideTransition(
        position: animation.drive(Tween<Offset>(begin:Offset(1.0, 0.0),end: Offset(0.0,0.0) ))
        ,
        child:cartItems[idx]
       ,
      );
    });
  }
}

class CartItem extends StatelessWidget {
  const CartItem( {
    Key? key, required this.item, required this.delete,
  }) : super(key: key);

  final Map<String,dynamic> item;
  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
       // tileColor: Colors.green.withOpacity(0.1),

        leading: Container(
          height: 80,
          width: 80,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: NetworkImage(item["img"]??""))
          ),
        ),
        title: Text(item["name"]),
        subtitle: Text("${item["price"]} GHS"),
        trailing: OverflowBar(
          children: [
            IconButton(
              iconSize: 15,
                padding: EdgeInsets.all(4),
                onPressed: (){}, icon: Icon(FontAwesomeIcons.minus)),
            IconButton(
              iconSize: 15,
                padding: EdgeInsets.all(4),
                onPressed: (){}, icon: Icon(FontAwesomeIcons.plus)),
            IconButton(onPressed: delete, icon: Icon(FontAwesomeIcons.trash)),

          ],
        ),
      ),
    );
  }
}
