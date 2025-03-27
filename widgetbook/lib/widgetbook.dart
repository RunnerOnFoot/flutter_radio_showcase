import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'use_cases/radio_button_use_case.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(useMaterial3: true).copyWith(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                  brightness: Brightness.dark,
                ),
              ),
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [Devices.ios.iPhone13, Devices.android.samsungGalaxyS20],
        ),
        TextScaleAddon(scales: [1.0, 1.2, 1.5]),
      ],
      directories: [
        WidgetbookCategory(
          name: 'Form Controls',
          children: [
            WidgetbookComponent(
              name: 'Radio Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const RadioButtonUseCase(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
