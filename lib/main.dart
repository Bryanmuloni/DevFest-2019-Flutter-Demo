import 'package:dev_fest_2019_demo/model/locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATM Locations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final locations = atmLocations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        elevation: 3.0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {}),
        title: Text('ATM Locations'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
          children: locations.map((atm) {
        return buildAtmLocation(atm);
      }).toList()),
    );
  }

  Widget buildAtmLocation(atm) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(20.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(20.0),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              firstColumn(),
              secondColumn(atm),
              Spacer(),
              thirdColumn(atm)
            ],
          ),
        ),
      ),
    );
  }

  Widget firstColumn() {
    return CircleAvatar(
      backgroundColor: Colors.indigo,
      child: Icon(
        Icons.business,
        color: Colors.white,
      ),
    );
  }

  Widget secondColumn(ATM atm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            atm.bankName,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            atm.locationName,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: FlutterRatingBarIndicator(
            rating: atm.bankRating,
            fillColor: Colors.pinkAccent,
            emptyColor: Colors.grey,
            itemSize: 20.0,
          ),
        )
      ],
    );
  }

  Widget thirdColumn(ATM atm) {
    return Align(
      child: Text('Plot ${atm.plotNumber}'),
    );
  }
}
