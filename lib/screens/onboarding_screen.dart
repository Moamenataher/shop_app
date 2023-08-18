import 'package:flutter/material.dart';
import 'package:untitled1/screens/signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _Welcome();
}

class _Welcome extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          width: double.infinity,
          // color: Colors.pinkAccent,
          child: Column(


            children: [SizedBox(height: 50,),
              Text("trendy app",style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),),
              const SizedBox(height: 40,),
              Image.network(
                "https://img.freepik.com/premium-photo/pink-colored-women-clothes_746318-3034.jpg?w=2000",
                height: 200,
              ),
              SizedBox(height: 20,),
              Text(
                  "Welcome to trendy, Let’s shop!",style: TextStyle(
                fontSize: 20,
              ),
              ),
              const SizedBox(height: 330,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffFE8095),
                  ),
                  child: MaterialButton(


                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewLoginScreen()));
                      },
                      child: Text(" Let\'s Get Started ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        )
                        ,),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}