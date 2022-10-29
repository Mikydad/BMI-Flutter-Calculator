import 'package:flutter/material.dart';
import 'Constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        color: Colors.white,
        size: 80,
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(label, style: KLabelTextStyle)
    ]);
  }
}
