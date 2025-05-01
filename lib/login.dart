import 'package:flutter/material.dart';
import 'package:syncserve/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Container(
                      color: Colors.grey,
                      height: 80,
                      width: 100,
                    ),
                  ),
                  const Text(
                    style: AppStyle.headingText,
                    'Welcome back!',
                  ),
                  //TEXTFORMFIELD OF EMAIL
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: TextFormField(
                      //TEXTFIELD COMMON STYLES FOR EMAIL AND PASSWORD
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      autocorrect: false,
                      cursorColor: Colors.black,
                      decoration: AppStyle.inputDecoration(
                        'Email',
                      ),
                    ),
                  ),
                  //TEXTFIELD OF PASSWORD
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      obscureText: isPassVisible,
                      decoration: AppStyle.inputDecoration('Password').copyWith(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPassVisible = !isPassVisible;
                            });
                          },
                          icon: Icon(
                            isPassVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ELEVATED BUTTON OF LOG IN
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: AppStyle
                            .elevatedButtonStyle,
                        child: const Text(
                          'Log In',
                        ),
                      ),
                    ),
                  ),  
                  //FORGOT PASSWORD
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      style: AppStyle.hintText,
                      'Forgot password',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
