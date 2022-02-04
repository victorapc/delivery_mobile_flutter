import 'package:delivery_mobile_flutter/app/core/ui/delivery_ui.dart';
import 'package:flutter/material.dart';

class IconBadge extends StatelessWidget {
  final int number;
  final IconData icon;

  const IconBadge({
    Key? key,
    required this.number,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 9,
              backgroundColor: Colors.red,
              child: Text(
                number.toString(),
                style: DeliveryUI.textBold.copyWith(fontSize: 9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
