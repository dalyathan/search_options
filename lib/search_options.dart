library search_options;

import 'package:flutter/material.dart';
import 'options_icon_painter.dart';
import 'theme.dart';

import 'search_field.dart';

class SearchOptions extends StatefulWidget {
  final bool allowMultiple;
  final Map<String, VoidCallback> options;
  final double height;
  final double width;
  final Color? iconColor;
  const SearchOptions(
      {Key? key,
      required this.allowMultiple,
      required this.options,
      required this.height,
      required this.width,
      this.iconColor})
      : super(key: key);

  @override
  State<SearchOptions> createState() => _SearchOptionsState();
}

class _SearchOptionsState extends State<SearchOptions> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double searchBarHeight = widget.height * 0.575;
    double searchContentHeight = searchBarHeight * 0.95;
    BorderRadius borderRadius =
        BorderRadius.circular(searchContentHeight * 0.2);
    return Container(
        width: widget.width,
        height: searchBarHeight,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SearchField(
            width: widget.width * 0.775,
            height: searchContentHeight,
            borderRadius: borderRadius,
          ),
          Container(
            width: searchContentHeight,
            height: searchContentHeight,
            child: Center(
              child: CustomPaint(
                painter: OptionsIconPainter(),
                size: Size.square(searchContentHeight * 0.4),
              ),
            ),
            decoration: BoxDecoration(
              color: DefaultTheme.greenish,
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 10,
                  blurRadius: 3,
                  offset: const Offset(0, 0),
                )
              ],
            ),
          )
        ]));
  }
}
