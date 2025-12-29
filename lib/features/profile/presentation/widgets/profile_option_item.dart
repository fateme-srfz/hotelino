import 'package:Hotelino/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileOptionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const ProfileOptionItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15),
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios_new_rounded, size: 14),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkFocusedBorder
                      : const Color(0xFFF4EAE2),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  icon,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppColors.darkFocusedBorder,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
