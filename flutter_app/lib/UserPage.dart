import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drawer.dart';

class UserPage extends StatelessWidget{
  BuildContext previousOne;
  String username;
  UserPage(BuildContext context,String username){
    previousOne = context;
    this.username = username;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: UserPageWidget(context,username),
    );
  }
}

class UserPageWidget extends StatefulWidget{

  BuildContext previousOne;
  String username;
  UserPageWidget(BuildContext context,String username){
    previousOne = context;
    this.username = username;
  }

  @override
  _UserPageWidget createState() => _UserPageWidget(previousOne,username);
}

class _UserPageWidget extends State<UserPageWidget>{

  BuildContext previousOne;
  String username;
  var listOfFields = ["Name","E-mail","Change Data"] ;
  var listOfAnswers = ["User"];
  var listOfIcons = [];

  _UserPageWidget(BuildContext context,String username){
    previousOne = context;
    this.username = username;
    listOfAnswers.add(username);
    listOfAnswers.add("Here you can change your profile");
    listOfIcons.add(Icon(
      Icons.person,
      size: 32,
        color: Colors.white
    ));
    listOfIcons.add(Icon(
      Icons.email,
      size: 32,
      color: Colors.white
    ));
    listOfIcons.add(Icon(
        Icons.account_circle,
        size: 32,
        color: Colors.white
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SideDrawer(username),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              height: 250.0,
              child:Stack(
                children: [
                  Container(),
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      height: 230.0,
                      color: Colors.teal,
                    ),
                  ),
                  Align(
                      alignment: Alignment(0,1),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            CircleAvatar(
                              radius: 70,
                              child: Text(username,
                                style: TextStyle(
                                    fontFamily: GoogleFonts.openSans().fontFamily,
                                    fontSize:20,
                                    color: Colors.black
                                ),),
                              backgroundColor: Colors.tealAccent[400],
                            ),
                          ]
                      )
                  ),
                  TopContent(),
                ],
              ),
            ),
            SizedBox(height: 25),
            CardItem(listOfFields[0], listOfAnswers[0], listOfIcons[0]),
            SizedBox(height: 5),
            CardItem(listOfFields[1], listOfAnswers[1], listOfIcons[1]),
            SizedBox(height: 5),
            CardItem(listOfFields[2], listOfAnswers[2], listOfIcons[2]),
          ],
        )
      )

    );
  }

  Widget TopContent(){
    return SafeArea(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(previousOne);
              }
          ),
        ],
      ),
    );
  }



}

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height-120);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}

class CardItem extends StatelessWidget{

  final String field, fieldFill;
  final Icon icon;

  const CardItem(this.field,this.fieldFill,this.icon);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding:EdgeInsets.symmetric(horizontal: 16),
        child: Card(
            color: Colors.orangeAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 21,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(width:24,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(field,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height:5),
                      Text(fieldFill,
                        style: TextStyle(
                          fontFamily: GoogleFonts.openSans().fontFamily,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      );
  }

}