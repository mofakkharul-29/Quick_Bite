import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String fText;
  final String deliveryTime;
  final String priceText;

  const CardInfo({
    super.key,
    required this.icon,
    this.iconColor,
    required this.fText,
    required this.deliveryTime,
    required this.priceText,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11);

    return Row(
      children: [
        Icon(icon, color: iconColor, size: 16),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            fText,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(' • ', style: style),
        Text(deliveryTime, style: style),
        Text(' • \u09F3', style: style),
        Flexible(
          child: Text(
            priceText,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
