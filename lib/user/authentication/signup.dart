import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:padi/database/database_connection.dart';

import '../model/user.dart';
import 'login.dart';


class signup extends StatefulWidget {

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  var formKey = GlobalKey<FormState>();
  var fullnameController = TextEditingController();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  registerAndSaveUserRecord() async {
    User userModel = User(
      1,
      fullnameController.text.trim(),
      usernameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    try{
      var res = await http.post(
        Uri.parse(database.signUp),
            body: userModel.toJson(),
      );

      if(res.statusCode == 200){
        var resBodyOfSignUp = jsonDecode(res.body);

        if(resBodyOfSignUp['success'] == true){
          Fluttertoast.showToast(msg: "SignUp Successful.");

          setState(() {
            fullnameController.clear();
            usernameController.clear();
            emailController.clear();
            passwordController.clear();
          });

          Get.to(login());
        }
        else{
          Fluttertoast.showToast(msg: "Error Occurred, Try Again.");
        }
      }
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 248, 255, 20),
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  //signup signup form
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 146, 192, 50),
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(0, -3),
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [
                            const Text("Real Time Water Level",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            const Text("Monitoring System",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),

                            const SizedBox(height: 18,),

                            //name, email, password, signup button
                            Form(
                              key: formKey,
                              child: Column(

                                children: [
                                  //getting fullname from user
                                  TextFormField(
                                    controller: fullnameController,
                                    validator: (val) => val == "" ? "Please write your full name" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      hintText: "full name...",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          )
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(0, 63, 100, 50),
                                            width: 3.0,                                          )
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(height: 18,),

                                  //getting username from user
                                  TextFormField(
                                    controller: usernameController,
                                    validator: (val) => val == "" ? "Please write your username" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      hintText: "username...",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          )
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(0, 63, 100, 50),
                                            width: 3.0,                                          )
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  //add space between name and email box
                                  const SizedBox(height: 18,),

                                  //getting email from user
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val) => val == "" ? "Please write email" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      hintText: "email...",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          )
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(0, 63, 100, 50),
                                            width: 3.0,                                          )
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  //add space between email and password box
                                  const SizedBox(height: 18,),

                                  //getting password from user
                                  Obx(
                                        () => TextFormField(
                                      controller: passwordController,
                                      obscureText: isObsecure.value,
                                      validator: (val) => val == "" ? "Please write password" : null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.vpn_key_sharp,
                                          color: Colors.black,
                                        ),
                                        //add icon to hide and show password
                                        suffixIcon: Obx(
                                              ()=> GestureDetector(
                                            onTap: () {
                                              isObsecure.value = !isObsecure.value;
                                            },
                                            child: Icon(
                                              isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        hintText: "password...",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Color.fromRGBO(0, 63, 100, 50),
                                              width: 3.0,                                            )
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),

                                  //add space between login and password box
                                  const SizedBox(height: 18,),
                                ],
                              ),
                            ),

                            //already have an account and login here button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an Account?"),
                                TextButton(
                                  onPressed: () {
                                    Get.to(login());
                                  },
                                  child: const Text("Login Here",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: ()
                            {
                              registerAndSaveUserRecord();
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 28,
                              ),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  ),

                  Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                          //width: MediaQuery.of(context).size.width,
                        height: 285,
                        child: Image.asset("images/1.png",),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
