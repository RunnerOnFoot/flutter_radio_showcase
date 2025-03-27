import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_radio_showcase/widgets/radio_button.dart';
import 'package:flutter_radio_showcase/theme/app_colors.dart';

class RadioButtonUseCase extends StatelessWidget {
  const RadioButtonUseCase({super.key});

  @override
  Widget build(BuildContext context) {
    // Use knobs to control widget properties.
    final radioState = context.knobs.list<RadioButtonState>(
      label: 'State',
      options: RadioButtonState.values,
      initialOption: RadioButtonState.inactive,
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
            // If state is disabled, onTap is null; otherwise we simply log a message.
            onTap:
                radioState == RadioButtonState.disabled
                    ? null
                    : () =>
                        debugPrint('Radio Button tapped in $radioState state'),
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
}
