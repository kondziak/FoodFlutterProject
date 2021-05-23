import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'FoodItem.dart';

class RestaurantsList extends StatefulWidget{

  static List<Restaurant> restaurants = [];

  RestaurantsList(List<Restaurant> restaurants);


  @override
  State createState() {
    return _RestaurantsList();
  }

  static Future <void> getRestaurants() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("restaurants").get();
    for(int i = 0; i < querySnapshot.docs.length; i++){
      var a = querySnapshot.docs[i];
      QuerySnapshot menu = await FirebaseFirestore.instance.collection("restaurants").doc(querySnapshot.docs[i].id).collection("menu").get();
      List<FoodItem> menus = [];
      for(int j = 0 ; j < menu.docs.length; j++){
          menus.add(new FoodItem(name: menu.docs[j].get("name"), price: menu.docs[j].get("price"),
              ID: menu.docs[j].id, restaurant:a.id , img: menu.docs[j].get("img")));
      }
      restaurants.add(new Restaurant(city: a.get("city"), location: a.get("location"),
        name: a.get("name"), img: a.get("img"), foodItems: menus,));
      FoodRestaurants.restaurantsList.add(restaurants.elementAt(i));
    }

  }
}

class _RestaurantsList extends State<RestaurantsList>{


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      child: Column(
        children: [
          RestaurantTitle(),
          Expanded(
            child: SomeFoodItems(RestaurantsList.restaurants),
          )
        ],
      )
    );
  }
}

class RestaurantTitle extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Popular restaurants",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w300
                )
            ,)
        ],
      ),
    );
  }
}

class Restaurant extends StatelessWidget{
  String city,location,name,img;
  List<FoodItem> foodItems;

  void setFoodItems(List<FoodItem> items){
    foodItems = items;
  }


  Restaurant({Key key,@required this.city,@required this.location,
    @required this.name, @required this.img, @required this.foodItems}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Column(
        children: [
            Container(
              child: Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Container(
                  width: 170,
                  height: 180,
                  child: Column(
                    children: <Widget>[
                  Stack(
                  children: <Widget>[
                    Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      padding: EdgeInsets.only(right: 5, top: 5),
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFfae3e2),
                                blurRadius: 25.0,
                                offset: Offset(0.0, 0.75),
                              ),
                            ]),
                      ),
                    ),
                  ),
                    Container(
                      padding: EdgeInsets.only(left:30,top:15),
                      child: Image.network(img,
                        width: 100,
                        height: 100,),
                    ),

                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(left: 10, top: 125),
                      child: Text(name +  " " + city + " " + location,
                          style: TextStyle(
                              color: Color(0xFF6e6e71),
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                    ]
              ),
            ),
          ),
        ),
      ],
    ),
    );
  }

}

class SomeFoodItems extends StatelessWidget{

  List<Restaurant> restaurants = [];

  SomeFoodItems(List<Restaurant> restaurants){
    this.restaurants = restaurants;
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Restaurant(city: restaurants.elementAt(0).city, location: restaurants.elementAt(0).location,
            name: restaurants.elementAt(0).name, img: restaurants.elementAt(0).img),
        Restaurant(city: restaurants.elementAt(1).city, location: restaurants.elementAt(1).location,
            name: restaurants.elementAt(1).name, img: restaurants.elementAt(1).img),
        Restaurant(city: restaurants.elementAt(2).city, location: restaurants.elementAt(2).location,
            name: restaurants.elementAt(2).name, img: restaurants.elementAt(2).img),
      ],
    );
  }
}