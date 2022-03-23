import 'package:flutter/material.dart';
import 'package:search_options/options_tab.dart';

class OptionsList extends StatefulWidget {
  final Map<String, VoidCallback> options;
  final bool allowMultiple;
  const OptionsList(
      {Key? key, required this.options, required this.allowMultiple})
      : super(key: key);

  @override
  State<OptionsList> createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  List<bool> selectedOptions = [];
  @override
  void initState() {
    super.initState();
    for (var item in widget.options.keys) {
      selectedOptions.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double tabWidth = size.width * 0.2;
    double tabHeight = size.height * 0.035;
    List<String> values = List<String>.from(widget.options.keys);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: tabWidth * 0.25, vertical: tabHeight * 0.5),
      child: SizedBox(
        width: tabWidth * values.length,
        height: tabHeight,
        child: ListView.separated(
          itemCount: values.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => OptionsTab(
            width: tabWidth * 0.8,
            height: tabHeight,
            value: values[index],
            callback: () {
              updateOptions(index);
              widget.options[values[index]]!();
            },
            isSelected: selectedOptions[index],
          ),
          separatorBuilder: (_, __) => SizedBox(
            width: size.width * 0.05,
          ),
        ),
      ),
    );
  }

  void updateOptions(int itemIndex) {
    List<bool> copiedStateValues = [];
    for (var value in selectedOptions) {
      copiedStateValues.add(value);
    }
    copiedStateValues[itemIndex] = copiedStateValues[itemIndex] ? false : true;
    if (widget.allowMultiple == false) {
      for (int index = 0; index < copiedStateValues.length; index++) {
        if (index != itemIndex) {
          copiedStateValues[index] = false;
        }
      }
    }
    setState(() {
      selectedOptions = copiedStateValues;
    });
  }
}
