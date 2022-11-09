import 'package:flutter/material.dart';
import '../../../api/models/result_model.dart';
import '../../../utils/constants.dart';

class MovieTileDiscription extends StatelessWidget {
  const MovieTileDiscription({
    Key? key,
    required this.currentModel,
  }) : super(key: key);

  final ResultModel currentModel;

  @override
  Widget build(BuildContext context) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(currentModel.releasedDate * 1000);
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currentModel.title,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
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
          Text('Mins | '
              "${currentModel.language} | "
              "${date.day} ${months[date.month - 1]}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text("${currentModel.pageViews} Views |")),
              TextButton(
                  onPressed: () {},
                  child: Text("Voted by ${currentModel.totalVoted} People")),
              // TextButton(
              //     onPressed: () {},
              //     child: Text("Views"))
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
