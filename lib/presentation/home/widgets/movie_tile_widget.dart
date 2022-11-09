import 'package:flutter/material.dart';

import '../../../api/models/result_model.dart';
import '../../../utils/constants.dart';
import 'movie_tile_description.dart';
import 'movie_tile_image.dart';
import 'movie_tile_vote_widget.dart';

class MovieTileWidget extends StatelessWidget {
  const MovieTileWidget({
    Key? key,
    required this.currentModel,
  }) : super(key: key);

  final ResultModel currentModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              //votes
              MovieTileVoteWidget(currentModel: currentModel),
              kwidth,
              //image
              MovieTileImage(currentModel: currentModel),
              kwidth,
              MovieTileDiscription(currentModel: currentModel)
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 30,
            child: ElevatedButton(
                onPressed: () {}, child: const Text("Watch Trailer")),
          )
        ],
      ),
    );
  }
}
