import 'package:flutter/material.dart';
import '../widgets/radio_button.dart';

class RadioButtonShowcase extends StatefulWidget {
  const RadioButtonShowcase({super.key});

  @override
  State<RadioButtonShowcase> createState() => _RadioButtonShowcaseState();
}

class _RadioButtonShowcaseState extends State<RadioButtonShowcase> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Button States')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRadioOption('Option 1', 1),
                const SizedBox(width: 24),
                _buildRadioOption('Option 2', 2),
              ],
            ),

            const SizedBox(height: 48),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStateDemo('Active', RadioButtonState.active),
                const SizedBox(width: 24),
                _buildStateDemo('Inactive', RadioButtonState.inactive),
                const SizedBox(width: 24),
                _buildStateDemo('Disabled', RadioButtonState.disabled),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String label, int option) {
    return Row(
      children: [
        RadioButton(
          state:
              selectedOption == option
                  ? RadioButtonState.active
                  : RadioButtonState.inactive,
          onTap: () => setState(() => selectedOption = option),
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildStateDemo(String label, RadioButtonState state) {
    return Column(
      children: [
        RadioButton(
          state: state,
          onTap:
              state == RadioButtonState.disabled
                  ? null
                  : () => {/* No action needed for demo */},
          size: 20,
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
