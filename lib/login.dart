import 'package:flutter/material.dart';

class Login extends StatefulWidget{

  const Login ({super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State <Login> {

  bool isPassVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey,
              ),
              height: 120,
              width: 120,
            ),
          ),
          const SizedBox(
            height: 40,
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
                  'Welcome back!',
              ),
            ],
          ),
          //TEXTFIELD OF EMAIL
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 22, horizontal: 10,),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          //TEXTFORMFIELD OF PASSWORD
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: TextFormField(
              cursorColor: Colors.black,
              obscureText: isPassVisible,
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 22, horizontal: 10,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassVisible = !isPassVisible;
                        });
                      },
                      icon: Icon(
                          isPassVisible ? Icons.visibility_off : Icons
                              .visibility,
                      ),
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: const Text(
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  'Log In',
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
                  decorationColor: Colors.black,
                  color: Colors.black,
                ),
                'Forgot password',
            ),
          ),
        ],
    ),
      ),
      ),
    );
    }
  }