import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flutter_radio_showcase/widgets/labeled_radio_button.dart';
import 'package:flutter_radio_showcase/widgets/radio_button.dart';

@UseCase(name: 'Labeled Radio Button Showcase', type: LabeledRadioButton)
Widget labeledRadioButtonUseCase(BuildContext context) {
  final radioState = context.knobs.list<RadioButtonState>(
    label: 'State',
    options: RadioButtonState.values,
    initialOption: RadioButtonState.active,
    labelBuilder: (option) => option.name,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LabeledRadioButton(
          state: radioState,
          label: 'Label',
          sublabel: 'Sublabel',
          description: 'Description here',
          badge: 'Badge',
          onTap:
              radioState == RadioButtonState.disabled
                  ? null
                  : () => debugPrint('Radio button tapped'),
        ),
        LabeledRadioButton(
          state: RadioButtonState.disabled,
          label: 'Label',
          sublabel: 'Sublabel',
          description: null,
          badge: null,
        ),
        LabeledRadioButton(
          state: RadioButtonState.inactive,
          label: 'Label',
          sublabel: 'Sublabel',
          description: 'Description here',
          badge: 'Badge',
        ),
      ],
    ),
  );
}
