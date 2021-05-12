import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SearchWidget.dart';
import 'User.dart';
import 'drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatelessWidget {

  User user;

  MainPage(User u){
    user = u;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPageWidget(user)
    );
  }

}

class MainPageWidget extends StatefulWidget{
  User user;

  MainPageWidget(User user){
    this.user = user;
  }

  @override
  _MainPageWidget createState() => _MainPageWidget(user);
}

class _MainPageWidget extends State<MainPageWidget>{
  String state;
  User user;

  _MainPageWidget(User user){
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(
        child: SideDrawer(user),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SearchWidget(
                onCountChanged:(String val){
                  setState(() {
                    state = val;
                  });
                }
              ),
              getRestaurants(context),
            ],
          )
        ],
      ),
    );
  }

  Widget getRestaurants(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('restaurants').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData) return LinearProgressIndicator();
          return Column(
            children: [
              Text(snapshot.data.docs[0]["city"]),
              Text(snapshot.data.docs[0]["location"]),
              Text(snapshot.data.docs[0]["name"]),
            ]
          );
        });
  }


}
