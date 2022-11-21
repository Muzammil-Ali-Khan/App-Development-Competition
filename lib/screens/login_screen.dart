import 'package:app_development_competition/helpers/constants.dart';
import 'package:app_development_competition/screens/homepage.dart';
import 'package:app_development_competition/screens/signup_screen.dart';
import 'package:app_development_competition/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/data.dart';
import '../widgets/CustomButton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                "assets/images/login.svg",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 30.0),
              ),
              const SizedBox(
                height: 30.0,
              ),
              CustomTextField(
                controller: emailController,
                hintText: "Enter your Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your password",
                textInputType: TextInputType.text,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Don't have an account? Sign Up"),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              CustomButton(
                title: "Sign In",
                onTap: () {
                  if (emailController.text == user1['email'] ||
                      emailController.text == user2['email']) {
                    if (passwordController.text == user1['password'] ||
                        passwordController.text == user2['password']) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    theme: user1["theme"].toString(),
                                  )));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Please enter right credentials",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: primaryColor,
                    ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
