import 'package:flutter/material.dart';
import 'package:notes/main.dart';
import 'package:notes/methods/auth_methods.dart';
import 'package:notes/screens/sign_up_screen.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_text_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
      Size size=MediaQuery.of(context).size;
      height=size.height;
      width=size.width;
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
                  Text("Login",style: TextStyle(fontSize: height*0.03,fontFamily: 'Pacifico-Regular',fontWeight: FontWeight.w700,color: Colors.blueGrey),),
                
                ],
              ),
              SizedBox(height: height*0.03,),
              CustomTextField(_emailController, false, Icons.email, "Enter your email",1),
              SizedBox(height: height*0.03,),
              CustomTextField(_passwordController, true, Icons.key, "Enter your password",1),
              SizedBox(height: height*0.03,),
              CustomButton(() async{ 
                var res=await AuthMethods().loginUser(_emailController.text, _passwordController.text,context);
                print(res);
              },"Login"),
              SizedBox(height: height*0.015,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                },
                child: RichText(text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black,fontSize: height*0.015),
                  children: [
                   TextSpan(text: "Sign Up",style: TextStyle(color: Colors.blueGrey)),
                ])),
              ),
            ],
            ),
        ),
      ),),
    );
  }
}