import 'package:flutter/material.dart';

import 'options_icon_painter.dart';
import 'search_field.dart';
import 'theme.dart';

class SearchBar extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback toggleOptions;
  const SearchBar(
      {Key? key,
      required this.width,
      required this.height,
      required this.toggleOptions})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    //double searchBarHeight = widget.height * 0.575;
    double searchContentHeight = widget.height * 0.95;
    BorderRadius borderRadius =
        BorderRadius.circular(searchContentHeight * 0.2);
    return Container(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(
            width: widget.width * 0.775,
            height: searchContentHeight,
            borderRadius: borderRadius,
          ),
          GestureDetector(
            onTap: widget.toggleOptions,
            child: Container(
              width: searchContentHeight,
              height: searchContentHeight,
              decoration: BoxDecoration(
                color: DefaultTheme.greenish,
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 10,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: CustomPaint(
                  painter: OptionsIconPainter(),
                  size: Size.square(searchContentHeight * 0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
