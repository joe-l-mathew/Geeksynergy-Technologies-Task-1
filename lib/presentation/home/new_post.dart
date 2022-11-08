import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/api_method.dart';
import 'package:geeksynergy_technologies/api/movie_model.dart';
import 'package:geeksynergy_technologies/api/response/response.dart';
import 'package:geeksynergy_technologies/presentation/widgets/main_button_widget.dart';
import 'package:geeksynergy_technologies/provider/response_provider.dart';
import 'package:geeksynergy_technologies/utils/constants.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../widgets/default_form_field.dart';

class NewPost extends StatelessWidget {
  final categoryController = TextEditingController();
  final languageController = TextEditingController();
  final genreController = TextEditingController();
  final sortController = TextEditingController();

  NewPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultFormField(
            isObscure: false,
            inputType: TextInputType.name,
            label: "Category",
            controller: categoryController),
        kheight,
        DefaultFormField(
            isObscure: false,
            inputType: TextInputType.name,
            label: "Language",
            controller: languageController),
        kheight,
        DefaultFormField(
            isObscure: false,
            inputType: TextInputType.name,
            label: "Genre",
            controller: genreController),
        kheight,
        DefaultFormField(
            isObscure: false,
            inputType: TextInputType.name,
            label: "Genre",
            controller: sortController),
        kheight,
        MainButtonWidget(
            sign: "Post",
            onPressed: () async {
              final Response res = await ApiMethods().sentData(
                  MovieModel(
                      categoryController.text,
                      languageController.text,
                      genreController.text,
                      sortController.text,
                      "movieName",
                      "director",
                      "staring",
                      0,
                      0),
                  context);
              Provider.of<ResponseProvider>(context, listen: false)
                  .setResponse(ResponseModel.fromJson(res.body));
              Provider.of<ResponseProvider>(context, listen: false)
                  .isLoadingFun(false);
            })
      ],
    );
  }
}
