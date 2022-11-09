import 'package:flutter/material.dart';

import '../../../api/models/result_model.dart';

class MovieTileVoteWidget extends StatelessWidget {
  const MovieTileVoteWidget({
    Key? key,
    required this.currentModel,
  }) : super(key: key);

  final ResultModel currentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.arrow_drop_up_sharp,
          size: 50,
        ),
        Text(currentModel.voting.toString()),
        const Icon(
          Icons.arrow_drop_down,
          size: 50,
        ),
        const Text("Votes")
      ],
    );
  }
}
