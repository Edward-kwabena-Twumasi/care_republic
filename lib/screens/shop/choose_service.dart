import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const shopData = {
  "name":"Vivians Hair Salon",
  "location":"Accra Spintex,AM 25",
 "services": [

]

};

class ChooseService extends SearchDelegate {
  final String searchTerm;

  ChooseService(this.searchTerm);
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
                padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 1),
                child: Chip(
                      label: Text(searchTerm),
                    ),
              ))),
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.filter))];
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
        itemCount: 8,
        itemBuilder: ((context, index) => Card(
              child: ListTile(
                title: Text(searchTerm + " " + index.toString()),
              ),
            )));
  }
}
