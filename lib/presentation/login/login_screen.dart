import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/api_method.dart';
import 'package:geeksynergy_technologies/api/movie_model.dart';
import 'package:geeksynergy_technologies/db/user_model.dart';
import 'package:geeksynergy_technologies/db_functions/db_functions.dart';
import 'package:geeksynergy_technologies/functions/show_snackbar.dart';
import 'package:geeksynergy_technologies/presentation/home/home_screen.dart';
import 'package:geeksynergy_technologies/presentation/signup/signup_screen.dart';
import 'package:geeksynergy_technologies/presentation/widgets/default_form_field.dart';
import 'package:geeksynergy_technologies/presentation/widgets/main_button_widget.dart';
import 'package:geeksynergy_technologies/presentation/widgets/main_title_widget.dart';
import 'package:geeksynergy_technologies/api/response/response.dart';
import 'package:geeksynergy_technologies/utils/constants.dart';
import 'package:http/http.dart';

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
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (builder) => HomeScreen()),
                            (route) => false);
                      } else {
                        showSnackbar(
                            message: "Invalid Name or Password",
                            context: context);
                      }
                    } else {
                      showSnackbar(
                          message: "Please fill all fields", context: context);
                    }
                  }),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (builder) => SignupScreen()),
                          (route) => false);
                    },
                    child: const Text("Create an account")),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   Response res = await ApiMethods().sentData(
      //       MovieModel("Hello", "language", "jdjdj", "sort", "movieName",
      //           "director", "staring", 10, 0),
      //       context);
      //   print(MovieModel("Hello", "language", "jdjdj", "sort", "movieName",
      //           "director", "staring", 10, 0)
      //       .toJson());
      //   var a = ResponseModel.fromJson(res.body);
      //   print(a.queryParam!.category);

      //   print(res.body);
      // }),
    );
  }
}
