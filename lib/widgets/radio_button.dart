import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum RadioButtonState { active, inactive, disabled }

class RadioButton extends StatelessWidget {
  final RadioButtonState state;
  final VoidCallback? onTap;
  final double size;
  final Color activeColor;
  final Color inactiveColor;
  final Color disabledColor;
  final Color borderColor;
  final Color splashColor;

  const RadioButton({
    super.key,
    this.state = RadioButtonState.inactive,
    this.onTap,
    this.size = 24.0,
    this.activeColor = AppColors.primaryDefault,
    this.inactiveColor = AppColors.onSurfaceVariantLow,
    this.disabledColor = AppColors.primaryContainer,
    this.borderColor = AppColors.primaryDefault,
    this.splashColor = AppColors.primaryHover,
  });

  bool get _isActive => state == RadioButtonState.active;
  bool get _isDisabled => state == RadioButtonState.disabled;

  @override
  Widget build(BuildContext context) {
    final Color currentBorderColor = _getStateColor(
      active: activeColor,
      inactive: borderColor,
      disabled: disabledColor,
    );

    final Color currentInnerColor = _getStateColor(
      active: activeColor,
      inactive: inactiveColor,
      disabled: disabledColor.withOpacity(0.5),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _isDisabled ? null : onTap,
        customBorder: const CircleBorder(),
        splashColor:
            _isDisabled ? Colors.transparent : splashColor.withOpacity(0.3),
        hoverColor:
            _isDisabled ? Colors.transparent : splashColor.withOpacity(0.1),
        splashFactory: InkRipple.splashFactory,
        radius: size * 1.5,
        child: Opacity(
          opacity: _isDisabled ? 0.6 : 1.0,
          child: Padding(
            padding: EdgeInsets.all(size * 0.25),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: size,
              width: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: currentBorderColor, width: 2.0),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: _isActive ? size * 0.55 : 0,
                  width: _isActive ? size * 0.55 : 0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentInnerColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getStateColor({
    required Color active,
    required Color inactive,
    required Color disabled,
  }) {
    switch (state) {
      case RadioButtonState.active:
        return active;
      case RadioButtonState.inactive:
        return inactive;
      case RadioButtonState.disabled:
        return disabled;
    }
  }
}
