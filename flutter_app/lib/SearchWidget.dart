import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget{
  final Function(String) onCountChanged;

  SearchWidget({
    @required this.onCountChanged
  });

  @override
  _SearchWidget createState() => _SearchWidget();
}

class _SearchWidget extends State<SearchWidget>{
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:10,top:10,right:10),
      child: TextField(
        style: TextStyle(
          fontSize: 20,
        ),
        controller:  _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width:0,
              color:  Color(0xFFfb3132),
              style: BorderStyle.none
            )
          ),
          filled: true,
          suffixIcon: IconButton(
            icon:Icon(Icons.search),
            color:Color(0xFFfb3132),
            onPressed: (){
              widget.onCountChanged(_controller.text);
            },
          ),
          hintStyle: TextStyle(fontSize: 14),
          hintText: "What would you like to choose?"
        ),
      ),
    );
  }
  
}