import 'package:flutter/material.dart';

class VerticalSpace extends StatefulWidget {
  final double space;

  const VerticalSpace({Key? key, required this.space}) : super(key: key);

  @override
  _VerticalSpaceState createState() => _VerticalSpaceState();
}

class _VerticalSpaceState extends State<VerticalSpace> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.space,
    );
  }
}
