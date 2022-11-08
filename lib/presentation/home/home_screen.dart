import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/api_method.dart';
import 'package:geeksynergy_technologies/api/response/response.dart';
import 'package:geeksynergy_technologies/presentation/widgets/default_form_field.dart';
import 'package:geeksynergy_technologies/provider/response_provider.dart';
import 'package:geeksynergy_technologies/utils/constants.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../api/movie_model.dart';
import 'nav.dart';
import 'new_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var res = await ApiMethods().sentData(
          MovieModel("Movie", "Kannada", "All", "Vote", "movieName", "director",
              "staring", 10, 0),
          context);
      // ignore: use_build_context_synchronously

      // print(res.body);
      final model = ResponseModel.fromJson(res.body);

      Provider.of<ResponseProvider>(context, listen: false).setResponse(model);
      Provider.of<ResponseProvider>(context, listen: false).isLoadingFun(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: NavDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: Provider.of<ResponseProvider>(context).isLoading,
                    child: const LinearProgressIndicator()),
                Provider.of<ResponseProvider>(context).isLoading
                    ? const Text("POSTING DATA...")
                    : Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text("POST RESPONSE:"),
                                kheight,
                                Text(
                                    "category: ${Provider.of<ResponseProvider>(context).myResponse!.queryParam!.category} "),
                                Text(
                                    "language: ${Provider.of<ResponseProvider>(context).myResponse!.queryParam!.language}"),
                                Text(
                                    "genre: ${Provider.of<ResponseProvider>(context).myResponse!.queryParam!.genre}"),
                                Text(
                                    "sort: ${Provider.of<ResponseProvider>(context).myResponse!.queryParam!.sort} "),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // Text("POST NEW VALUE"),
                          // kheight,
                          // NewPost()
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
