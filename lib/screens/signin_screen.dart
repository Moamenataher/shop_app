
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/screens/navigationscreen.dart';
import 'package:untitled1/screens/signup_screen.dart';
import '';
class NewLoginScreen extends StatefulWidget {
  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  bool visible = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  signIn() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (BuildContext context) => NavigationScreen()));
      } else {
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xffFE8095),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        title: const Text(
          "Sign in",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                " Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFE8095),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email shouldn't be empty";
                    }
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(


                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: " Email Address",
                    hintText: "Enter your email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),

                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password shouldn't be empty";
                    }
                  },
                  controller: passwordController,
                  obscureText: visible,
                  decoration: InputDecoration(


                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: " Password",
                    hintText: "Enter your password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    suffixIcon: IconButton(
                      icon: visible ? Icon(Icons.remove_red_eye) : Icon(
                          Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Colors.grey
                      ),

                    ),

                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFE8095),
                  borderRadius: BorderRadius.circular(20,),

                ),
                width: 250,
                child: MaterialButton(

                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      signIn();
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewRegisterScreen()));
                },
                child: const Text(
                  "create new account",
                  style: TextStyle(color: Color(0xffFE8095),fontSize: 18,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
