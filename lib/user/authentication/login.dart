import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:padi/user/authentication/signup.dart';
import 'package:http/http.dart' as http;
import 'package:padi/database/database_connection.dart';
import 'package:padi/user/fragments/dashboard.dart';
//import 'package:padi/user/fragments/dashboard.dart';
import 'package:padi/user/userPreferences/user_preferences.dart';
//import 'package:padi/user/authentication/signup.dart';


import '../model/user.dart';


class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(database.login),
        body: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      if(res.statusCode == 200){
        var resBodyOfLogin = jsonDecode(res.body);

        if(resBodyOfLogin['success'] == true){
          Fluttertoast.showToast(msg: "Login Successful.");

          User userInfo = User.fromJson(resBodyOfLogin["userData"]);

          await RememberUserPrefs.saveRememberUser(userInfo);

          Future.delayed(const Duration(milliseconds: 2000),() {
            Get.to(const dashboard());

          });


        }
        else{
          Fluttertoast.showToast(msg: "Error Occurred, Try Again.");
        }
      }
    }
    catch(errotMsg){
      print("Error :: " + errotMsg.toString());
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
                  //const SizedBox(height: 50,),
                  //login header
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset("images/GUI.png",),
                  ),

                  const SizedBox(height: 20,),

                  const Text("SawahCheck",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 63, 100, 50),
                    ),
                  ),

                  const Text("Real Time Water Level",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 63, 100, 50),
                    ),
                  ),

                  const Text("Monitoring System",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 63, 100, 50),
                    ),
                  ),

                  const SizedBox(height: 10,),
 
                  //login sign-in form
                  Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [
                            //email, password, login button
                            Form(
                              key: formKey,
                              child: Column(
                                children: [

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
                                            width: 3.0,
                                          )
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
                                                width: 3.0,                                              )
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
                            /*Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Are you an Admin"),
                                TextButton(
                                  onPressed: () {

                                  },
                                  child: const Text("Click Here",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),*/
                          ],
                      ),//sini login
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: ()
                            {
                              Get.to(signup());
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 28,
                              ),
                              child: Text(
                                "Register ?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Material(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: ()
                            {
                              if(formKey.currentState!.validate()){
                                loginUserNow();
                              }
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 28,
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
