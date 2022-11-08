import 'dart:ffi';

import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({
    Key? key,
    required this.sign,
    required this.onPressed,
  }) : super(key: key);

  final String sign;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(sign));
  }
}
