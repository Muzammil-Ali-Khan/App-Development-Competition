import 'package:app_development_competition/helpers/constants.dart';
import 'package:app_development_competition/provider/themeProvider.dart';
import 'package:app_development_competition/screens/login_screen.dart';
import 'package:app_development_competition/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../helpers/data.dart';
import '../widgets/CustomButton.dart';
import 'homepage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController interestController = TextEditingController();

  String selectedValue = dropDownItems.first;

  ThemeProvider theme = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    theme = Provider.of<ThemeProvider>(context);

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
                "Sign Up",
                style: TextStyle(fontSize: 30.0),
              ),
              const SizedBox(
                height: 30.0,
              ),
              CustomTextField(
                controller: nameController,
                hintText: "Enter your name",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 15.0,
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
                controller: ageController,
                hintText: "Enter your age",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 15.0,
              ),
              DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  theme.setTheme(value!);
                },
                items:
                    dropDownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Already have an account? Sign In"),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                theme: selectedValue,
                              )));
                },
                title: "Sign Up",
              )
            ],
          ),
        ),
      ),
    );
  }
}
