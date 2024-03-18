import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_1/constants/string.dart';

class CommonContainer extends StatefulWidget {
  String inspectimage;
  CommonContainer({super.key, required this.inspectimage});

  @override
  State<CommonContainer> createState() => _CommonContainerState();
}

class _CommonContainerState extends State<CommonContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: Colors.indigo[100],
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage("$imageUrl${widget.inspectimage}"))),
    );
  }
}
