import 'package:cooky/src/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  RadioButton({Key? key, required this.typeList, required this.notifyParent})
      : super(key: key);
  List<String> typeList;
  Function(SearchType) notifyParent;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  SearchType type = SearchType.cookName;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          widget.typeList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: type == SearchType.values[index]
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.onTertiary),
              onPressed: () {
                setState(() {
                  type = SearchType.values[index];
                });
                widget.notifyParent(type);

                if (kDebugMode) {
                  print(type);
                }
              },
              child: Text(
                widget.typeList[index].toString(),
              ),
            ),
          ),
        ));
  }
}
