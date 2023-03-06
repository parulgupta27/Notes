import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  bool obsecure;
  IconData icon;
  String hint;
  int lines;
  CustomTextField(this.controller,this.obsecure,this.icon,this.hint,this.lines);
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: lines,
      minLines: lines,
      controller: controller,
     decoration: InputDecoration(
       hintText: hint,
       prefixIcon: Icon(icon,),
       border: OutlineInputBorder(borderSide: BorderSide(width: 1)
       
       ),
       focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.2,color: Colors.blueGrey.shade800)
       
       ),
       ), 

    );
  }
}