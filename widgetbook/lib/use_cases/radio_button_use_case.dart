import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flutter_radio_showcase/widgets/radio_button.dart';
import 'package:flutter_radio_showcase/theme/app_colors.dart';

@UseCase(name: 'Radio Button Showcase', type: RadioButton)
Widget radioButtonUseCase(BuildContext context) {
  final radioState = context.knobs.list<RadioButtonState>(
    label: 'State',
    options: RadioButtonState.values,
    initialOption: RadioButtonState.active,
    labelBuilder: (option) => option.name,
  );

  final size = context.knobs.double.slider(
    label: 'Size',
    min: 12,
    max: 48,
    initialValue: 24,
    divisions: 12,
  );

  final activeColor = context.knobs.color(
    label: 'Active Color',
    initialValue: AppColors.primaryDefault,
  );
  final inactiveColor = context.knobs.color(
    label: 'Inactive Color',
    initialValue: AppColors.onSurfaceVariantLow,
  );
  final disabledColor = context.knobs.color(
    label: 'Disabled Color',
    initialValue: AppColors.primaryContainer,
  );
  final borderColor = context.knobs.color(
    label: 'Border Color',
    initialValue: AppColors.primaryDefault,
  );
  final splashColor = context.knobs.color(
    label: 'Splash Color',
    initialValue: AppColors.primaryHover,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioButton(
          state: radioState,
          onTap:
              radioState == RadioButtonState.disabled
                  ? null
                  : () =>
                      debugPrint('Radio button tapped on $radioState state'),
          size: size,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          disabledColor: disabledColor,
          borderColor: borderColor,
          splashColor: splashColor,
        ),
        const SizedBox(height: 16),
        Text('State: ${radioState.name}'),
      ],
    ),
  );
}
