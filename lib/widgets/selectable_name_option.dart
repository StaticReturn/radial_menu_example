import 'package:flutter/material.dart';


typedef SFunction = Function(String a);

class SelectableNameOption extends StatefulWidget {
  const SelectableNameOption({ required this.label, required this.selectedLabel, Key? key }) : super(key: key);
  final String label;
  final ValueNotifier<String> selectedLabel;

  @override
  State<SelectableNameOption> createState() => _SelectableNameOptionState();
}

class _SelectableNameOptionState extends State<SelectableNameOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {widget.selectedLabel.value = widget.label;},
      child: ValueListenableBuilder(
        valueListenable: widget.selectedLabel,
        builder: (BuildContext context, String value, Widget? child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: (widget.selectedLabel.value == widget.label)
                ? Colors.blue
                : Colors.blue.shade200,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            child: child,
          );
        },
        child: Center(
          child: Text(widget.label, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}