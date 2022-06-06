import 'package:flutter/material.dart';

class Sizer {
  final BuildContext context;
  final bool hasAppBar;
  final bool hasBottomNav;
  Sizer({required this.hasAppBar, required this.hasBottomNav, required this.context});

  MediaQueryData mediaQueryData(){
    return MediaQuery.of(context);
  }

  double parentWidth(){
    return MediaQuery.of(context).size.width;
  }
   double parentHeight(){
    return MediaQuery.of(context).size.height;
  }

  double hBlockSize(){
    return parentWidth()/100;
  }

  double vBlockSize(){
    return parentHeight()/100;
  }

  double hSafeArea(){
    return mediaQueryData().padding.left +
        mediaQueryData().padding.right;
  }

  double vSafeArea(){
    double heightPadding=mediaQueryData().padding.top +
        mediaQueryData().padding.bottom;
    if(hasAppBar){
     heightPadding= AppBar().preferredSize.height + heightPadding;
    }
    if(hasBottomNav){
      heightPadding=kBottomNavigationBarHeight+heightPadding;
    }
    return heightPadding;
  }
  double vSafeBlock(){
    return (parentHeight() -
        vSafeArea()) / 100;
  }

  double hSafeBlock(){
    return (parentWidth() -
        hSafeArea()) / 100;
  }

  double ch(double heightInPercentage){
    return vSafeBlock()*heightInPercentage;
  }
  double cw(double widthInPercentage){
    return hSafeBlock()*widthInPercentage;
  }


}