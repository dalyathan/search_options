library search_options;

import 'package:flutter/material.dart';

import 'options_list.dart';
import 'search_bar.dart';

class SearchOptions extends StatefulWidget {
  final bool allowMultiple;
  final Map<String, VoidCallback> options;
  final double height;
  final double width;
  final Color? optionsIconBackgroundColor;
  final Color? optionsIconForegroundColor;
  final TextStyle? textStyle;
  const SearchOptions({
    Key? key,
    required this.options,
    required this.height,
    required this.width,
    this.optionsIconBackgroundColor,
    this.optionsIconForegroundColor,
    this.textStyle,
    this.allowMultiple = false,
  }) : super(key: key);

  @override
  State<SearchOptions> createState() => _SearchOptionsState();
}

class _SearchOptionsState extends State<SearchOptions> {
  bool showOptions = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: showOptions ? widget.height * 0.9 : 0,
            child: OptionsList(
                options: widget.options, allowMultiple: widget.allowMultiple)),
        SearchBar(
          width: widget.width,
          height: widget.height,
          toggleOptions: () => setState(() {
            showOptions = showOptions ? false : true;
          }),
        ),
      ],
    );
  }
}
