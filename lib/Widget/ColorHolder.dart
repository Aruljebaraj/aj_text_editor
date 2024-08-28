
import 'package:flutter/material.dart';

class ColorHolder extends StatelessWidget {
  final Color color;
  final Function(Color) onTap;
  final bool active;

  const ColorHolder({super.key,
    required this.color,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: active
            ? Border.fromBorderSide(
            BorderSide(color: Theme.of(context).colorScheme.onSurface))
            : null,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () => onTap(color),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.fromBorderSide(
                  BorderSide(color: Theme.of(context).colorScheme.onSurface)),
              borderRadius: BorderRadius.circular(50),
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}