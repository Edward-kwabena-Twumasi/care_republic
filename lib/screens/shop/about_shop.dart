import 'package:flutter/material.dart';

class AboutShop extends StatefulWidget {
  const AboutShop({Key? key}) : super(key: key);

  @override
  State<AboutShop> createState() => _AboutShopState();
}

class _AboutShopState extends State<AboutShop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 479,
      //height: 1102,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 479,
              height: 270,
              padding: const EdgeInsets.only(
                left: 25,
                right: 5,
                top: 30,
                bottom: 197,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 449,
                          height: 43,
                          color: Color(0x00ffffff),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 32,
                            top: 10,
                            bottom: 9,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterLogo(size: 24),
                              ),
                              SizedBox(width: 167.50),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterLogo(size: 24),
                              ),
                              SizedBox(width: 167.50),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterLogo(size: 24),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: FlutterLogo(size: 270),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11.64),
            Container(
              width: 104,
              height: 31,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 104,
                    height: 31,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Color(0xfffb9400),
                    ),
                    padding: const EdgeInsets.only(
                      left: 31,
                      right: 28,
                      top: 3,
                      bottom: 6,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Open",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11.64),
            Text(
              "Vivians Cosmetic shop",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: "Spartan",
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 11.64),
            Container(
              width: 118,
              height: 22,
              padding: const EdgeInsets.only(
                right: 6,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 14,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfffb9400),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Osu accra",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Spartan",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11.64),
            Container(
              width: 172,
              height: 23,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfffb9400),
                    ),
                  ),
                  SizedBox(width: 18),
                  Text(
                    "3.5(200 reviews)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Spartan",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11.64),
            SizedBox(
              height: 72,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0x00ffffff),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            child: Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfffef2e0),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: FlutterLogo(size: 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Website",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "Spartan",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0x00ffffff),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            child: Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfffef2e0),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: FlutterLogo(size: 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Website",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "Spartan",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 88,
                      height: 95,
                      color: Color(0x00ffffff),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            child: Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfffef2e0),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: FlutterLogo(size: 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Message",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "Spartan",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 88,
                      height: 95,
                      color: Color(0x00ffffff),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            child: Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfffef2e0),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: FlutterLogo(size: 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Call",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "Spartan",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 88,
                      height: 95,
                      color: Color(0x00ffffff),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            child: Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfffef2e0),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: FlutterLogo(size: 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Direction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "Spartan",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 11.64),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Color(0xfffb9400),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 7,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About us",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Spartan",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 11),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(
                      color: Color(0xfffb9400),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 7,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Products",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffb9400),
                          fontSize: 15,
                          fontFamily: "Spartan",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 11),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(
                      color: Color(0xfffb9400),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 7,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gallery",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffb9400),
                          fontSize: 15,
                          fontFamily: "Spartan",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 11),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(
                      color: Color(0xfffb9400),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 7,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reviews",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffb9400),
                          fontSize: 15,
                          fontFamily: "Spartan",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 11.64),
            Text(
              "Viavians cosmetivs is your number one stop point for all your\n consmetic products.We have cleansers,pomades, wipers and many \nmore Do look up our products in the products page",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 11.64),
            Text(
              "Working Hours",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Spartan",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 11.64),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: FlutterLogo(size: 100),
            ),
            SizedBox(height: 11.64),
            Text(
              "Monday - Saturday     : 8:00 AM -18:00 PM",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 11.64),
            Text(
              "Conract Us",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Spartan",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 11.64),
            Text(
              "0552489602",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 11.64),
            Text(
              "Our Location",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Spartan",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 11.64),
            Container(
              width: 434,
              height: 164,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: FlutterLogo(size: 164),
            ),
          ],
        ),
      ),
    );
    // Container(
    //   width: 24,
    //   height: 24,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   child: FlutterLogo(size: 24),
    // );
  }
}
