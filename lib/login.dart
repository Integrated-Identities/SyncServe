import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login ({super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State <Login>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
          height: 150,
          ),
          //WELCOME BACK TEXT
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
                "Welcome back!"
              ),
            ],
          ),
          //TEXTFIELD OF EMAIL
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.all(18),
                  child: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                )
              ),
            ),
          ),
          //TEXTFIELD OF PASSWORD
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: TextField(
              decoration: InputDecoration(
                 suffixIcon: Padding(
                   padding: EdgeInsets.all(18),
                   child: Icon(
                    Icons.visibility,
                    color: Colors.grey,
                                   ),
                 ),
                 hintText: "Password",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          //GESTURE DETECTOR OF LOG IN
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 125, 125),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    style: TextStyle(
                      fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    ),
                    "Log In",
                  ),
                ),
              ),
            ),
            //FORGOT PASSWORD
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    color: Colors.blue,
                  ),
                "forgot password"
                            ),
              )
        ],
      ),
    );
  }
}