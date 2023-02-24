import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/spacing.dart';
import 'package:radial_menu_example/data/strings_en.dart';
import 'package:radial_menu_example/widgets/selectable_name_option.dart';


class Flower extends StatefulWidget {
  const Flower({ Key? key }) : super(key: key);

  @override
  State<Flower> createState() => _FlowerState();
}


class _FlowerState extends State<Flower> with TickerProviderStateMixin {
  final ValueNotifier<String> selectedLabel = ValueNotifier<String>('');
  late AnimationController scaleController = AnimationController(value: 0.4, duration: const Duration(milliseconds: 600), vsync: this);
  late Animation<double> scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.easeInOutBack);
  late AnimationController fadeController = AnimationController(value: 0.0, duration: const Duration(milliseconds: 400), vsync: this);
  late Animation<double> fadeAnimation = CurvedAnimation(parent: fadeController, curve: Curves.easeIn);
  int failedTries = 0;
  int triesAfterSuccess = 0;
  bool succeeded = false;

  @override
  void initState() {
    selectedLabel.addListener(_startAnimatingFromStart);
    super.initState();
  }

  @override
  void dispose() {
    scaleController.dispose();
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: verticalScreenPadding, horizontal: horizontalScreenpadding),
        child: Column(
          children: [
            const Text('Please tap the name of this flower.', style: TextStyle(fontSize: 18.0)),
            Container(
              margin: const EdgeInsets.only(top: 24.0, bottom: 24.0),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Image.asset('assets/images/flower.jpg'),
            ),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              runSpacing: 12.0,
              children: [
                for (var flowerName in flowerNameList)
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: SelectableNameOption(
                      label: flowerName,
                      selectedLabel: selectedLabel,
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Center(
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: ValueListenableBuilder(
                      valueListenable: selectedLabel,
                      builder: (BuildContext context, String value, Widget? child) {
                        if (value == 'Plumeria alba') succeeded = true;
                        final Color textColor = _getTextColor(value);
                        final String text = _getText(value);

                        return Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 28.0, color: textColor));
                      }
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _startAnimatingFromStart() {
    scaleController.value = 0.4;
    scaleController.forward();
    fadeController.value = 0.0;
    fadeController.forward();
  }

  String _getText(String selectedText) {
    String text = '';

    if (!succeeded) {
      if (failedTries >= failedFlowerMessages.length) {
        text = failedFlowerMessages.last;
      } else {
        text = failedFlowerMessages[failedTries];
      }
      failedTries++;
    } else {
      if (triesAfterSuccess == 0) {
        if (failedTries >= flowerMessagesAfterFailures.length) {
          text = flowerMessagesAfterFailures.last;
        } else {
          text = flowerMessagesAfterFailures[failedTries];
        }
      } else {
        if (triesAfterSuccess >= alreadySucceededMessage.length) {
          text = alreadySucceededMessage.last;
        } else {
          text = alreadySucceededMessage[triesAfterSuccess];
        }
      }
      triesAfterSuccess++;
    }

    return text;
  }

  Color _getTextColor(String selectedText) {
    if (!succeeded) {
      return Colors.red.shade400;
    } else {
      if (triesAfterSuccess == 0) {
        return Colors.green;
      } else {
        return Colors.grey.shade600;
      }
    }
  }
}
