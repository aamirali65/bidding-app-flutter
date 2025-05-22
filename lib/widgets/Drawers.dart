import 'package:flutter/material.dart';
import 'package:gobidder/widgets/customText.dart';
import 'package:gobidder/widgets/theme.dart';

class DrawerListItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const DrawerListItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: ThemeColor),
            const SizedBox(width: 10),
            Expanded(
              child: MyText(
                text: text,
                color: ThemeColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
