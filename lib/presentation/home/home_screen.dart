import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/api_method.dart';
import 'package:geeksynergy_technologies/api/models/result_model.dart';

import 'package:geeksynergy_technologies/provider/response_provider.dart';
import 'package:geeksynergy_technologies/utils/constants.dart';
import 'package:provider/provider.dart';

import 'nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ResultModel> resList = [];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      resList = await ApiMethods().sentData(
          
          context);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                  visible: Provider.of<ResponseProvider>(context).isLoading,
                  child: Center(child: const CircularProgressIndicator())),
              kheight,
              Provider.of<ResponseProvider>(context).isLoading
                  ? Center(child: const Text("POSTING DATA..."))
                  : Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: resList.length,
                          itemBuilder: ((context, index) {
                            ResultModel currentModel = resList[index];
                            var date = DateTime.fromMillisecondsSinceEpoch(
                                currentModel.releasedDate * 1000);

                            return SizedBox(
                              height: 195,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      //votes
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.arrow_drop_up_sharp,
                                            size: 50,
                                          ),
                                          Text(currentModel.voting.toString()),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 50,
                                          ),
                                          Text("Votes")
                                        ],
                                      ),
                                      kwidth,
                                      //image
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      currentModel.poster))),
                                          height: 135,
                                          width: 80,
                                        ),
                                      ),
                                      kwidth,
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              currentModel.title,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "Genre: ${currentModel.genre}",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "Director: ${currentModel.director.join()} ",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'staring: ${currentModel.stars.join()}',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text('Mins | ' +
                                                "${currentModel.language} | " +
                                                "${date.day} ${months[date.month - 1]}"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Spacer(),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                        "${currentModel.pageViews} Views |")),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                        "Voted by ${currentModel.totalVoted} People")),
                                                // TextButton(
                                                //     onPressed: () {},
                                                //     child: Text("Views"))
                                                Spacer()
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Watch Trailer")),
                                  )
                                ],
                              ),
                            );
                          })),
                    )
              // Text("Hello")
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   print(Provider.of<ResponseProvider>(context, listen: false)
      //       .result![3]
      //       .title);
      // }),
    );
  }
}
