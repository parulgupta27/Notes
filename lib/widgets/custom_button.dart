import 'package:flutter/material.dart';
import 'package:notes/main.dart';
class CustomButton extends StatelessWidget {
  VoidCallback func;
  String text;
   CustomButton(this.func,this.text);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: width*0.05),
      child: InkWell(
        onTap: func,
        child: SizedBox(
          height: height*0.045,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            onPressed: func,
            child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: height*0.024,fontFamily: "Pacifico-Regular"),))),
        ),
      ),
    );
  }
}