import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/FoodItem.dart';
import 'Restaurant.dart';
import 'SearchWidget.dart';
import 'User.dart';
import 'drawer.dart';


class MainPage extends StatelessWidget {

  User user;
  MainPage(User u) {
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

  _MainPageWidget(User user) {
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
              RestaurantsList(RestaurantsList.restaurants),
              FoodItemLists(),
            ],
          )
        ],
      ),
    );
  }


}
