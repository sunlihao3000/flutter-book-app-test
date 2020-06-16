import 'dart:convert';
import 'package:book_app/screens/book_list_screen.dart';
import 'package:book_app/widgets/reading_card_list.dart';
import 'package:flutter/material.dart';

class BookListTestPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<BookListTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Load JSON File From Local"),),
      body: Center(
        child: FutureBuilder(builder: (context, snapshot){
          var showData=json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return ReadingListCard(
                image: showData[index]['image'],
                title: showData[index]['title'],
                auth: "Herman Joel",
                rating: 4.8,
                pressDetails: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BookListScreen();
                      },
                    )
                  );
                }
              );              
            },
            itemCount: showData.length,
            scrollDirection: Axis.horizontal,

          );
        }, future: DefaultAssetBundle.of(context).loadString("assets/jsons/books-list.json"),
        ),
      ),
      
    );
  }
}
