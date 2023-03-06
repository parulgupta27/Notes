import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:notes/methods/auth_methods.dart';
import 'package:notes/screens/notes_screen.dart';
import '../main.dart';
import 'package:notes/screens/login_screen.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_text_field.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
   final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _nameController=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }
  Uint8List ?image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock,size: height*0.032,color: Colors.blueGrey,),
                  SizedBox(width: width*0.01,),
                  Text("Sign Up",style: TextStyle(fontSize: height*0.03,fontFamily: 'Pacifico-Regular',fontWeight: FontWeight.w700,color: Colors.blueGrey),),
                
                ],
              ),
              SizedBox(height: height*0.03,),
              image==null?CircleAvatar(
                radius: height*0.06,
                backgroundColor: Colors.blueGrey,
                child: IconButton(icon: Icon(Icons.person,size: height*0.04,),onPressed: ()async{
                  image=await AuthMethods().pickImage();
                  setState(() {
                    
                  });
                },),
              ):CircleAvatar(
                radius: height*0.06,
                backgroundColor: Colors.blueGrey,
                backgroundImage: MemoryImage(image!),
              )
              ,
              SizedBox(height: height*0.03,),
              CustomTextField(_nameController, false, Icons.email, "Enter your name",1),
              SizedBox(height: height*0.03,),
              CustomTextField(_emailController, false, Icons.email, "Enter your email",1),
              SizedBox(height: height*0.03,),
              CustomTextField(_passwordController, true, Icons.key, "Enter your password",1),
              SizedBox(height: height*0.03,),
              CustomButton(() async{
              var res=await AuthMethods().registerUser(_emailController.text, _passwordController.text, _nameController.text, image!,context);
              print(res);
              
              },"Sign Up"),
              SizedBox(height: height*0.015,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: RichText(text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black,fontSize: height*0.015),
                  children: [
                   TextSpan(text: "Login",style: TextStyle(color: Colors.blueGrey)),
                ])),
              )
            ],
            ),
        ),
      ),),
    );
  }
}