import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../scaling/scaler.dart';
import '../../theme/custom_theme.dart';

const shopData = {
  "name": "Vivians Hair Salon",
  "location": "Accra Spintex,AM 25",
  "services": []
};

class ChooseService extends SearchDelegate {
  final String searchTerm;
  final List serviceStyles;
  String defaultDisp = "List";
  final Sizer size;
  ChooseService(this.searchTerm, this.serviceStyles, this.size);
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Choose service";

  @override
  // TODO: implement searchFieldDecorationTheme
  // InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(

  // );
  PreferredSizeWidget? buildBottom(BuildContext context) {
    // TODO: implement buildBottom
    return PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 1),
                    child: Chip(
                      label: Text(searchTerm ),
                    ),
                  ))),
        ));
  }

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
    return ListView(
      children: [
        ListTile(
          title: Text("Down cut"),
        ),
        ListTile(
          title: Text("Fading"),
        )
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListView.builder(
        itemCount: serviceStyles.length,
        itemBuilder: ((context, index) => StyleCard(
            size: size, context: context, service: serviceStyles[index])));
  }
}

//shop card widget
class StyleCard extends StatelessWidget {
  const StyleCard({
    Key? key,
    required this.size,
    required this.context,
    required this.service,
  }) : super(key: key);

  final Sizer size;
  final BuildContext context;
  final Map<String, dynamic> service;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) => SalonInfo())));
                      },
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
