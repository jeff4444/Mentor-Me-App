import 'package:flutter/material.dart';
import 'package:mentor_mee/constants/constants.dart';

class Resources extends StatefulWidget {
  const Resources({super.key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Column(children: createTiles(context));
  }
}
