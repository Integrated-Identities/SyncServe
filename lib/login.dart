import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/dashboard.dart';
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
                  Text(
                    AppLocalizations.of(context)!.welcome,
                    style: AppStyle.headingText,
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
                        AppLocalizations.of(context)!.email,
                      ),
                    ),
                  ),

                  //TEXTFIELD OF PASSWORD
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      obscureText: isPassVisible,
                      decoration: AppStyle.inputDecoration(
                        AppLocalizations.of(context)!.password,
                      ).copyWith(
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
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Dashboard(),
                            ),
                          );
                        },
                        style: AppStyle.elevatedButtonStyle(),
                        child: Text(
                          AppLocalizations.of(context)!.logIn,
                        ),
                      ),
                    ),
                  ),
                  //FORGOT PASSWORD
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      AppLocalizations.of(context)!.forgotPassword,
                      style: AppStyle.hintText,
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
