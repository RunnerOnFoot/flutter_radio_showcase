import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'radio_button.dart';
import 'package:google_fonts/google_fonts.dart';

class LabeledRadioButton extends StatelessWidget {
  final RadioButtonState state;
  final VoidCallback? onTap;
  final double size;
  final String label;
  final String? sublabel;
  final String? description;
  final String? badge;
  final bool isRadioAtStart;
  final Color activeColor;
  final Color inactiveColor;
  final Color disabledColor;
  final Color borderColor;
  final Color splashColor;

  const LabeledRadioButton({
    super.key,
    required this.state,
    required this.label,
    this.sublabel,
    this.description,
    this.badge,
    this.onTap,
    this.size = 24.0,
    this.isRadioAtStart = true,
    this.activeColor = AppColors.primaryDefault,
    this.inactiveColor = AppColors.onSurfaceVariantLow,
    this.disabledColor = AppColors.primaryContainer,
    this.borderColor = AppColors.primaryDefault,
    this.splashColor = AppColors.primaryHover,
  });

  @override
  Widget build(BuildContext context) {
    final radioButton = RadioButton(
      state: state,
      onTap: onTap,
      size: size,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      disabledColor: disabledColor,
      borderColor: borderColor,
      splashColor: splashColor,
    );

    final labelContent = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: AppColors.onSurfaceDefault,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (sublabel != null) ...[
                const SizedBox(width: 4),
                Text(
                  '($sublabel)',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
              if (badge != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badge!,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.primaryDefault,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          if (description != null) ...[
            const SizedBox(height: 8),
            Text(
              description!,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            description != null
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children:
            isRadioAtStart
                ? [radioButton, labelContent]
                : [labelContent, radioButton],
      ),
    );
  }
}
