import 'package:flutter/material.dart';

class OptionsTab extends StatefulWidget {
  final double width;
  final double height;
  final String value;
  final VoidCallback callback;
  final bool isSelected;
  const OptionsTab(
      {Key? key,
      required this.width,
      required this.height,
      required this.value,
      required this.callback,
      required this.isSelected})
      : super(key: key);

  @override
  State<OptionsTab> createState() => _OptionsTabState();
}

class _OptionsTabState extends State<OptionsTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Center(
          child: Text(
            widget.value,
            style: TextStyle(
                color: widget.isSelected ? Colors.white : Colors.black),
          ),
        ),
        decoration: BoxDecoration(
            color: widget.isSelected ? Colors.black12 : Colors.transparent,
            borderRadius: BorderRadius.circular(widget.height * 0.5),
            border: Border.all(width: 1)),
      ),
    );
  }
}
