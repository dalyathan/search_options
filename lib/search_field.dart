import 'package:flutter/material.dart';
import 'package:search_options/theme.dart';

import 'search_icon_painter.dart';

class SearchField extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  const SearchField(
      {Key? key,
      required this.width,
      required this.height,
      required this.borderRadius})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool fieldNotFocused = true;
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var fontSize = widget.height * 0.4;
    return Container(
      width: widget.width,
      height: widget.height,
      child: Padding(
        padding: EdgeInsets.only(left: widget.width * 0.05),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            FocusScope(
              child: Focus(
                onFocusChange: (focus) => setState(() {
                  fieldNotFocused = focus ? false : true;
                }),
                child: TextField(
                  controller: textEditingController,
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none),
                ),
              ),
            ),
            Visibility(
              visible:
                  fieldNotFocused && textEditingController.value.text.isEmpty,
              child: SizedBox(
                width: widget.width * 0.4,
                height: fontSize,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomPaint(
                    //   painter: SearchIconPainter(),
                    //   size: Size.square(fontSize * 0.8),
                    // ),
                    Icon(Icons.search, size: fontSize * 1.2),
                    SizedBox(
                      height: fontSize,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            'Search',
                            style: DefaultTheme.style
                                .copyWith(color: Colors.grey[400]!),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 10,
            blurRadius: 3,
            offset: const Offset(0, 0),
          )
        ],
        // border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}
