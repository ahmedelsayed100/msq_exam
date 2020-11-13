import 'package:flutter/material.dart';

//this is for button to navigate to another exam screen
Widget continueButton(
    {String label, double screenWidth, double screenHeigth, Function myFun}) {
  return SizedBox(
    width: screenWidth * 0.6,
    child: RaisedButton(
      onPressed: myFun,
      child: Text(
        "$label",
        style: TextStyle(fontSize: 18),
      ),
      color: Colors.blue,
      textColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      padding: EdgeInsets.fromLTRB(
        screenWidth * 0.1,
        screenHeigth * 0.03,
        screenWidth * 0.1,
        screenHeigth * 0.03,
      ),
    ),
  );
}
//this for buttons

Widget customeFlatButton({String label, Function myFun, Color color}) {
  return FlatButton(
    onPressed: myFun,
    padding: EdgeInsets.all(20),
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Text(
      "$label",
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );
}

//this for show question
Widget questions(
    {BuildContext context,
    double screenWidth,
    double screenHeigth,
    var random,
    var data}) {
  return StatefulBuilder(builder: (context, StateSetter setState) {
    return Container(
      width: screenWidth * 0.1,
      height: screenHeigth * 0.1,
      decoration: BoxDecoration(
        color: Colors.grey[500],
      ),
      child: Text(
        "${data.quetions[random]}",
        style: TextStyle(fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  });
}
