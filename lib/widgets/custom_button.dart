import 'package:flutter/material.dart';

enum CustomButtonStyle { primary, secondary, danger, outline }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonStyle style;
  final Widget? icon;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style = CustomButtonStyle.primary,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final color = switch (style) {
      CustomButtonStyle.primary => colors.primary,
      CustomButtonStyle.secondary => colors.secondary,
      CustomButtonStyle.danger => colors.error,
      CustomButtonStyle.outline => colors.primary,
    };

    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: style == CustomButtonStyle.outline ? null : color,
        foregroundColor: style == CustomButtonStyle.outline
            ? color
            : colors.onPrimary,
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Row(mainAxisSize: MainAxisSize.min, children: [?icon, Text(text)]),
    );
  }
}
