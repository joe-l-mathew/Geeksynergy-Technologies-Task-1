import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/provider/response_provider.dart';
import 'package:provider/provider.dart';
import '../../api/models/result_model.dart';
import 'widgets/movie_tile_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ResultModel> resList = Provider.of<ResponseProvider>(context).result!;

    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: resList.length,
          itemBuilder: ((context, index) {
            return MovieTileWidget(currentModel: resList[index]);
          })),
    );
  }
}
