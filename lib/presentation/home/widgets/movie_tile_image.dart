import 'package:flutter/material.dart';
import '../../../api/models/result_model.dart';

class MovieTileImage extends StatelessWidget {
  const MovieTileImage({
    Key? key,
    required this.currentModel,
  }) : super(key: key);

  final ResultModel currentModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(currentModel.poster),
          ),
        ),
        height: 135,
        width: 80,
      ),
    );
  }
}
