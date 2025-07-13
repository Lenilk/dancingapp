import 'package:danceteaching/components/status_pad.dart';
import 'package:flutter/material.dart';

class StatusPadGroup extends StatelessWidget {
  final List<bool> isActive;
  const StatusPadGroup({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [statusPad(isActive[0]), statusPad(isActive[1])],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [statusPad(false)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [halfStatusPad(isActive[2]), halfStatusPad(isActive[3])],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [halfStatusPad(isActive[4]), halfStatusPad(isActive[5])],
          ),
        ],
      ),
    );
  }
}
