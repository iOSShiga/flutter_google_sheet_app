

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_google_sheet_app/monument_model.dart';

class MyHomePage extends StatelessWidget {

 final Future<List<MonumentModel>> monuments;

 MyHomePage({Key key,@required this.monuments}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text('Google Sheet'),
     ),
     body: Center(
      child: FutureBuilder(
          future: monuments,
          builder: (context, snapshot){

           if (snapshot.hasError){print(snapshot.error);}


       //return snapshot.hasData ? ListView(children: _monuments(snapshot.data),) : Center(child: CircularProgressIndicator(),);
            return snapshot.hasData ? monumentList(snapshot.data) : Center(child: CircularProgressIndicator(),);
      }),
     ),
    );
  }

  List<Card> _monuments(List<MonumentModel> monuments) => List.generate(monuments.length, (index) =>
  Card(
    elevation: 5,
   child: Container(
     padding: EdgeInsets.all(16.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("||" + monuments[index].name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),),
        Container(child: Image.network(monuments[index].imageUrl)),
       Container(child: Text('\n' + monuments[index].about, style: TextStyle(color: Colors.grey),))
      ],
     ),
   )
  )
  );


  Widget monumentList(List<MonumentModel> monuments){

    return ListView.builder(
        itemCount: monuments.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
         return Card(
           elevation: 5,
           child: Container(
             padding: EdgeInsets.all(16),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(monuments[index].name,
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                 Container(
                     padding: EdgeInsets.only(top: 5, bottom: 10),
                     child: Image.network(monuments[index].imageUrl)),
                 Text( monuments[index].about,
                 style: TextStyle(
                   color: Colors.grey
                 ),)
               ],
             ),
           ),
         );
        });
  }
}

