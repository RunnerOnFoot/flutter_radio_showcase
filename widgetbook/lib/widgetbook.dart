import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'use_cases/radio_button_use_case.dart';

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            // Light theme
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
            ),
            // Dark theme
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
          devices: [
            Devices.android.samsungGalaxyS20,
            Devices.ios.iPhone13ProMax,
          ],
        ),
        TextScaleAddon(initialScale: 1.0),
      ],
      directories: [
        WidgetbookCategory(
          name: 'From Controls',
          children: [
            WidgetbookComponent(
              name: 'Radio Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => radioButtonUseCase(context),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
