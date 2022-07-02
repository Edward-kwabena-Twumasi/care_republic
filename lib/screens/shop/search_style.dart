import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thecut/screens/shop/booking_page.dart';

import '../../scaling/scaler.dart';
import '../../theme/custom_theme.dart';

const shopData = {
  "name": "Vivians Hair Salon",
  "location": "Accra Spintex,AM 25",
  "services": []
};

class SearchStyle extends SearchDelegate {
  final String searchTerm;
  final List serviceStyles;
  String defaultDisp = "List";
  List selected=[];
  final Sizer size;
  SearchStyle(this.searchTerm, this.serviceStyles, this.size);
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Choose service";

  @override
  // TODO: implement searchFieldDecorationTheme
  // InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(

  // );


  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
      IconButton(
          onPressed: () {
            defaultDisp == "List" ? defaultDisp = "Grid" : defaultDisp = "List";
            print(defaultDisp);
          },
          icon: Icon(
            defaultDisp == "List" ? Icons.grid_3x3_rounded : Icons.list,
            color: Colors.black,
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return  StatefulBuilder(builder: (BuildContext context,StateSetter setState) {
      List suggestions=serviceStyles.map((style) => style["name"].contains(query)).toList();
      Color color=Colors.white;
      return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: ((context, index) => StyleCard(
              size: size, context: context, service: suggestions[index],
            color: color)
          ));
    },

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return  StatefulBuilder(builder: (BuildContext context, setState) {

      Color color=Colors.white;
      return Text("Chosen style");
    },

    );
  }
}

//shop card widget
class StyleCard extends StatelessWidget {
  const StyleCard({
    Key? key,
    required this.size,
    required this.context,
    required this.service, required this.color,
  }) : super(key: key);

  final Sizer size;
  final BuildContext context;
  final Map<String, dynamic> service;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
          
          width: size.cw(90),
          height: size.cw(36),
          child: Row(children: [
            Padding(
              padding:  EdgeInsets.all(size.cw(2)),
              child: Container(
                //padding: EdgeInsets.only(left:size.cw(2)),
                  height: size.cw(30),
                  width: size.cw(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                         15),
                      image: DecorationImage(
                          image: NetworkImage(service["img"]), fit: BoxFit.cover))),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListTile(
                      // onTap: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: ((context) => BookAppointment())));
                      // },
                      title: Text(service["name"]),
                      subtitle: Text(service["duration"]+" mins"),
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
                      label: Text(service["price"]),
                      // avatar: Icon(
                      //   Icons.star,
                      //   color: colorScheme.secondary.withOpacity(0.6),
                      // ),
                    ),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
