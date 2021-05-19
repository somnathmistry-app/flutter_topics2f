import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSeacrch());
              })
        ],
      ),
    );
  }
}

class DataSeacrch extends SearchDelegate<String> {
  final cities = [
    'agra',
    'Delhi',
    'mumbai',
    'chennai',
    'Durgapur',
    'Kolkata',
    'Jaipur',
    'Rajastan'
  ];
  final recentCities = ['agra', 'Delhi', 'mumbai', 'chennai', 'Durgapur'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on selection
   return Center(
     child: Container(
       height: 100.0,
       width: 100.0,
       child: Card(
         color: Colors.blue,
         shape: StadiumBorder(),
         child: Center(
           child: Text(query),
         ),
       ),
     ),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something
    final suggestionsList = query.isEmpty
        ? recentCities
        : cities.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: (){
            showResults(context);
          },
          leading: Icon(Icons.location_city),
          title: RichText(
            text: TextSpan(
                text: suggestionsList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: suggestionsList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                  )
                ]),
          ),
        );
      },
      itemCount: suggestionsList.length,
    );
  }
}
