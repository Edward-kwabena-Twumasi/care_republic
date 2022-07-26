import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key, required this.product}) : super(key: key);
  final Map<String,dynamic> product;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  bool animateCart=false;
  bool showViewCart=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      persistentFooterButtons: [

       showViewCart?Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           ElevatedButton(
               onPressed:(){},
               child: Text("View cart",style: TextStyle(fontWeight: FontWeight.bold),),
               style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.symmetric(
                       vertical: 15, horizontal: 50),
                   shape: StadiumBorder(),
                   primary: Colors.black,
                   textStyle: TextStyle(color: Colors.white))),
           ElevatedButton(
               onPressed:(){
                 Navigator.pop(context);
               },
               child:Icon(Icons.close,color: Colors.white,),
               style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.symmetric(
                       vertical: 10, horizontal: 3),
                   shape: StadiumBorder(),
                   primary: Colors.black,
                   textStyle: TextStyle(color: Colors.white)))
         ],
       )

           : ActionButtons(addToCart: (){
          setState(() {
            animateCart = !animateCart;
          });
        })
      ],


      body: Column(
        children:[
          Hero(
            
            tag: "prodImg",
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.product["img"]??"https://picsum.photos/id/21/200/200"),fit: BoxFit.cover)
              ),
              child:  AnimatedAlign(
                alignment: animateCart ? Alignment.topRight : Alignment.bottomLeft,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOutQuint,
                child: animateCart ? FlutterLogo(size: 50.0):Container(),
                onEnd: (){
                  print("Item added to cart successfully");
                  setState((){
                    animateCart=false;
                    showViewCart=true;
                  });
                  return;
                },
              ),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex:3,
                          child: Text(widget.product["name"],style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Unit price",style: TextStyle(fontWeight: FontWeight.w300)),
                            ),
                            Text(widget.product["price"]+" GHS",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w400))

                          ],
                        ),
                      )
                    ],
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Quantity"),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("After payment contact seller for items to be delivered. Send us any questions you have.",
                    style: TextStyle(fontSize: 15),),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text("Total",style: TextStyle(fontWeight: FontWeight.w300)),
                        Text(widget.product["price"]+" GHS",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w400))

                      ],
                    ),
                  ),
                )

              ],
            ),
          ))
        ]
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key, required this.addToCart}) : super(key: key);
  final VoidCallback addToCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed:addToCart,
            child: Text("Add to cart",style: TextStyle(fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                   vertical: 15, horizontal: 40),
                shape: StadiumBorder(),
                primary: Colors.amber,
                textStyle: TextStyle(color: Colors.white))),
        ElevatedButton(
            onPressed: () {
Navigator.pop(context);
            },
            child: Icon(Icons.close),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 5),
                shape: StadiumBorder(),
                primary: Colors.black,
            )),
        ElevatedButton(
            onPressed: () {

            },
            child: Text(
              "Buy now",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                   vertical: 15, horizontal: 40),
                shape: StadiumBorder(),
                primary: Colors.green,
                textStyle: TextStyle(color: Colors.white))),
      ],
    );
  }
}
