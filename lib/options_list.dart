import 'package:flutter/material.dart';
import 'package:search_options/options_tab.dart';

class OptionsList extends StatelessWidget {
  final Map<String, VoidCallback> options;
  const OptionsList({Key? key, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double tabWidth = size.width * 0.2;
    double tabHeight = size.height * 0.075;
    List<String> values = List<String>.from(options.keys);
    return ListView.separated(
      itemCount: values.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => OptionsTab(
          width: tabWidth,
          height: tabHeight,
          value: values[index],
          callback: options[values[index]]!),
      separatorBuilder: (_, __) => SizedBox(
        width: size.width * 0.05,
      ),
    );
  }
}
