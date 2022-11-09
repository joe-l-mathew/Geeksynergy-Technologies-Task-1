import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/db/user_model.dart';
import 'package:geeksynergy_technologies/db/db_functions/db_functions.dart';
import 'package:geeksynergy_technologies/functions/show_snackbar.dart';
import 'package:geeksynergy_technologies/presentation/home/home_screen.dart';
import 'package:geeksynergy_technologies/presentation/signup/signup_screen.dart';
import 'package:geeksynergy_technologies/presentation/widgets/default_form_field.dart';
import 'package:geeksynergy_technologies/presentation/widgets/main_button_widget.dart';
import 'package:geeksynergy_technologies/presentation/widgets/main_title_widget.dart';
import 'package:geeksynergy_technologies/utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final dbInstance = HiveDBFunctions();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const MainTitleWidget(title: "Login"),
              kheight,
              DefaultFormField(
                  isObscure: false,
                  inputType: TextInputType.name,
                  label: "Enter your name",
                  controller: nameController),
              kheight,
              DefaultFormField(
                  isObscure: true,
                  inputType: TextInputType.text,
                  label: "Enter your password",
                  controller: passwordController),
              kheight,
              MainButtonWidget(
                  sign: "Login",
                  onPressed: () async {
                    if (nameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      //login here
                      UserModel? myUser = await dbInstance.checkForUser(
                          name: nameController.text,
                          password: passwordController.text);

                      if (myUser != null) {
                        //prompt to login here
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (builder) => const HomeScreen()),
                            (route) => false);
                      } else {
                        //if name or password not found in DB
                        showSnackbar(
                            message: "Invalid Name or Password",
                            context: context);
                      }
                    } else {
                      //if some fields are missing
                      showSnackbar(
                          message: "Please fill all fields", context: context);
                    }
                  }),
              //signup page nav
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (builder) => const SignupScreen()),
                          (route) => false);
                    },
                    child: const Text("Create an account")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
