import 'package:flutter/material.dart';

class OptionsTab extends StatefulWidget {
  final double width;
  final double height;
  final String value;
  final VoidCallback callback;
  const OptionsTab(
      {Key? key,
      required this.width,
      required this.height,
      required this.value,
      required this.callback})
      : super(key: key);

  @override
  State<OptionsTab> createState() => _OptionsTabState();
}

class _OptionsTabState extends State<OptionsTab> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = isSelected ? false : true;
        });
      },
      child: Container(
          decoration: BoxDecoration(
        color: isSelected ? Colors.grey : Colors.transparent,
        borderRadius: BorderRadius.circular(widget.height * 0.5),
      )),
    );
  }
}
