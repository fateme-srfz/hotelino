import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  final bool visible;
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const OnboardingButton({
    super.key,
    required this.visible,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: visible
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
              child: FloatingActionButton(
                elevation: 0,
                onPressed: onPressed,
                backgroundColor: backgroundColor,
                shape: const CircleBorder(),
                child: Icon(icon, color: iconColor),
              ),
            )
          : const SizedBox(),
    );
  }
}
