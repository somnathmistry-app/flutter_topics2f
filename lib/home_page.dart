import 'package:flutter/material.dart';
import 'package:flutter_topics/search/search.dart';
import 'package:flutter_topics/sqflite/login.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topics'),),
      body: Column(
        children: [
             ElevatedButton(
              child: Text('SearchView'),
                onPressed: (){
              Get.to(
                  SearchView()
              );
            }),
          ElevatedButton(
              child: Text('SearchView'),
              onPressed: (){
                Get.to(
                    LoginSql()
                );
              }),
        ],
      ),
    );
  }
}
