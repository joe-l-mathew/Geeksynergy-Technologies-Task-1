import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/db/user_model.dart';
import 'package:geeksynergy_technologies/db_functions/db_functions.dart';
import 'package:geeksynergy_technologies/functions/show_snackbar.dart';
import 'package:geeksynergy_technologies/presentation/login/login_screen.dart';
import 'package:geeksynergy_technologies/presentation/widgets/main_title_widget.dart';
import 'package:geeksynergy_technologies/utils/constants.dart';

import '../widgets/default_form_field.dart';
import '../widgets/main_button_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final verificationController = TextEditingController();

  String dropdownvalue = 'Proffession 1';

  // List of items in our dropdown menu
  var items = [
    'Proffession 1',
    'Proffession 2',
    'Proffession 3',
    'Proffession 4',
    'Proffession 5',
  ];

  @override
  Widget build(BuildContext context) {
    String sign = "Signup";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const MainTitleWidget(title: "Signup"),
              kheight,
              DefaultFormField(
                  controller: nameController,
                  isObscure: false,
                  inputType: TextInputType.name,
                  label: "Enter your name"),
              kheight,
              DefaultFormField(
                  isObscure: false,
                  inputType: TextInputType.emailAddress,
                  label: "Enter your email",
                  controller: emailController),
              kheight,
              DefaultFormField(
                  isObscure: false,
                  inputType: TextInputType.phone,
                  label: "Enter phone number",
                  controller: phoneController),
              kheight,
              DefaultFormField(
                  isObscure: true,
                  inputType: TextInputType.text,
                  label: "Enter a password",
                  controller: passwordController),
              kheight,
              DefaultFormField(
                  isObscure: true,
                  inputType: TextInputType.text,
                  label: "Reenter password",
                  controller: verificationController),
              kheight,
              Center(
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              MainButtonWidget(
                sign: sign,
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      verificationController.text.isEmpty) {
                    showSnackbar(
                        message: "Please Fill all fields", context: context);
                  }
                  //signup action here
                  else if (passwordController.text ==
                      verificationController.text) {
                    //verified proceed
                    UserModel newUser = UserModel(
                        nameController.text,
                        emailController.text,
                        phoneController.text,
                        passwordController.text,
                        dropdownvalue);
                    await HiveDBFunctions().addUserToDB(newUser);
                    showSnackbar(message: "Account created", context: context);
                  } else {
                    showSnackbar(
                        message: "Password dosn't match", context: context);
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (builder) => const LoginScreen()),
                          (route) => false);
                    },
                    child: const Text("Already have an account ?")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
